<?php

$PYTHON_CACHE = "/var/cache/python";
$PYTHON_CACHE_JSON = $PYTHON_CACHE . "/json";
$PYTHON_CACHE_ETAG = $PYTHON_CACHE . "/etag";


# Returns name of etag file
function etag_filename ($namebase) {
    global $PYTHON_CACHE_ETAG;

    return $PYTHON_CACHE_ETAG . "/" . $namebase . ".etag";
}


# Returns name of json file
function json_filename ($namebase) {
    global $PYTHON_CACHE_JSON;

    return $PYTHON_CACHE_JSON . "/" . $namebase . ".json";
}


# Creates cache directories as necessary
function set_up_cache () {
    global
        $PYTHON_CACHE_ETAG,
        $PYTHON_CACHE_JSON;
    
    foreach (array($PYTHON_CACHE_ETAG, $PYTHON_CACHE_JSON) as $dir) {
        if (!file_exists($dir)) {
            mkdir ($dir, 0755, true);
        }
    }
}

# Returns true if etag exists for python module
function etag_exists ($namebase) {
    $etag_file = etag_filename ($namebase);
    return file_exists($etag_file);
}


# Returns value of previously retrieved etag
function stored_etag ($namebase) {
    $etag_file = etag_filename ($namebase);

    return file_get_contents($etag_file);
}


# Returns contents of previously stored json file
function stored_json ($namebase) {
    $json_file = json_filename ($namebase);

    return file_get_contents($json_file);
}

# Writes (or overwrites) etag value to cache
function write_etag ($namebase, $etag) {
    $etag_file = etag_filename ($namebase);

    file_put_contents($etag_file, $etag);
}


# Writes (or overwrites) json file to cache
function write_json ($namebase, $json) {
    $json_file = json_filename ($namebase);

    file_put_contents($json_file, $json);
}


# Deletes etag file from cache
function delete_stored_etag ($namebase) {
    if (etag_exists($namebase)) {
        $etag_file = etag_filename ($namebase);
        unlink ($etag_file);
    }
}


# Searches the HTTP response header for Etag and returns the contents
# If not found, returns False
# example: [11] => ETag: "FqVhlhRsztlMsjS4Vwiayg"
function extract_etag ($response_header) {
    foreach ($response_header as $line) {
        if (substr($line, 0, 5) == "ETag:") {
            $parts = explode(" ", $line);
            $inner = explode('"', $parts[1]);
            return $inner[1];
        }
    }
    return false;
}


# Searches the HTTP response header and return True if 304 (not modified)
# response has been returned.
function use_cached_json ($response_header) {
    return (strstr($response_header[0], "304 Not Modified") !== False);
}


# Get the latest json file.
# The PyPi site supports etags, so cache previous results.
# If the PyPi server says the content is unmodified, return our cached file,
# otherwise cache what we fetch and return it.
function fetch_from_pypi ($namebase) {
    global $PYTHON_CACHE_JSON;

    $pypi_url = "https://pypi.org/pypi/" . $namebase . "/json";

    printf ("%-62s : ", "Downloading $namebase");
    if (etag_exists($namebase)) {
        $etag = stored_etag ($namebase);
        $http_scheme = array 
            ("method" => "GET",
             "header" => "User-Agent: Ravenports Python Generator\r\n" .
                         "Accept: application/json\r\n" .
                         "If-None-Match: \"$etag\"\r\n");
        $opts = array ("http" => $http_scheme);
        $context = stream_context_create ($opts);
        $json = file_get_contents($pypi_url, false, $context);
        if ($json === False) {
           echo "FAILED! (with etag)\n";
           return false;
        }
        if (use_cached_json ($http_response_header)) {
            echo "Cached\n";
            return stored_json($namebase);
        } else {
            $new_etag = extract_etag($http_response_header);
            if ($new_etag !== false) {
                write_etag ($namebase, $new_etag);
            }
            write_json ($namebase, $json);
            echo "Successful (new content downloaded)\n";
            return $json;
        }
    }
    
    # No cache available, pull it unconditionally
    $json = file_get_contents($pypi_url);
    if ($json === False) {
        echo "FAILED!\n";
        return false;
    }
    $new_etag = extract_etag($http_response_header);
    write_etag ($namebase, $new_etag);
    write_json ($namebase, $json);
    echo "Successful (cache empty)\n";
    return $json;
}


# main function to ready python module and extract usable information
function scrape_python_info ($namebase, $force) {
    $result = array(
        "success"     => false,
        "version"     => "ERROR",
        "comment"     => "ERROR",
        "description" => "ERROR",
        "license"     => "UNSET",
        "homepage"    => "UNSET",
        "distfile"    => "ERROR",
        "buildrun"    => array(),
        "req_comment" => "# install_requires extracted from setup.py\n",
    );
    
    if ($force) {
        delete_stored_etag ($namebase);
    }
    if (fetch_from_pypi ($namebase) !== False) {
        ;;
    } 
    return $result;
}
?>