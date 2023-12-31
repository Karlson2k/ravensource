--- lib/the_Foundation/Depends.cmake.orig	2023-11-19 19:20:06 UTC
+++ lib/the_Foundation/Depends.cmake
@@ -14,24 +14,7 @@ if (NOT IOS AND NOT ANDROID)
     if (TFDN_ENABLE_TLSREQUEST)
         set (OPENSSL_FOUND NO)
         set (iHaveOpenSSL NO)
-        if (FREEBSD)
-            # Try the system-provided libraries first.
-            find_library (LIBSSL ssl)
-            find_library (LIBCRYPTO crypto)
-            if (LIBSSL AND LIBCRYPTO)
-               message (STATUS "Using system-provided libssl: ${LIBSSL}")
-                add_library (libssl INTERFACE)
-                target_link_libraries (libssl INTERFACE ${LIBSSL} ${LIBCRYPTO})
-                set (OPENSSL_FOUND YES)
-            else ()
-                pkg_check_modules (OPENSSL eopenssl11)
-                if (OPENSSL_FOUND)
-                    set (EOPENSSL_FOUND YES)
-                endif ()
-            endif ()
-        else ()
-             pkg_check_modules (OPENSSL openssl)
-        endif ()
+        pkg_check_modules (OPENSSL openssl)
     endif ()
     # Unicode text strings
     set (UNISTRING_DIR "" CACHE PATH "Location of libunistring")
