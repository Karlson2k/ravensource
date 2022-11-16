--- build-tui.sh.orig	2022-11-02 17:11:20 UTC
+++ build-tui.sh
@@ -14,25 +14,15 @@
 #
 # You can customize the install directory prefix here and build type here:
 
-INSTALL_PREFIX="/usr/local"
+INSTALL_PREFIX="__PREFIX__"
 CMAKE_BUILD_TYPE="Release"
+export PKG_CONFIG_PATH=/__PREFIX__/openssl11/lib/pkgconfig
+export LDFLAGS="-L/__PREFIX__/openssl11/lib -Wl,-rpath,/__PREFIX__/openssl11/lib"
 
 echo "\nThis script will build and optionally install clagrange with"
 echo "statically linked the_Foundation and SEALCurses. First, let's configure"
 echo "the build.\n"
 
-echo "Build type? [${CMAKE_BUILD_TYPE}]"
-read INPUT
-if [ "${INPUT}." != "." ]; then
-    CMAKE_BUILD_TYPE=${INPUT}
-fi
-
-echo "Install prefix? [${INSTALL_PREFIX}]"
-read INPUT
-if [ "${INPUT}." != "." ]; then
-    INSTALL_PREFIX=${INPUT}
-fi
-
 if [ ! -d lib/sealcurses ]; then
     echo "'lib/sealcurses' not found. Clone with Git? [Yn]"
     read INPUT
@@ -95,15 +85,11 @@ cmake .. \
     -DENABLE_HARFBUZZ=NO \
     -DENABLE_POPUP_MENUS=NO \
     -DENABLE_IDLE_SLEEP=NO \
+    -DCMAKE_SKIP_RPATH:BOOL=TRUE \
     -Dthe_Foundation_DIR="${BUILD_DIR}/lib/cmake/the_Foundation" \
     $*
 cmake --build . || exit 1
 
 echo "-----"
 echo "clagrange and resources.lgr can be found in 'build-tui'."
-echo "Do you want to install them to ${INSTALL_PREFIX}? (sudo) [yN]"
-read CONFIRMED
-if [ "${CONFIRMED}" = "y" ]; then
-    sudo cmake --install .
-    exit
-fi
+exit
