--- gtk/roaring/roaring.h.orig	2021-08-20 19:12:22 UTC
+++ gtk/roaring/roaring.h
@@ -59,7 +59,6 @@ enum {
 #include <stdint.h>
 #include <stdlib.h>  // will provide posix_memalign with _POSIX_C_SOURCE as defined above
 #if !(defined(__APPLE__)) && !(defined(__FreeBSD__)) && !(defined(__OpenBSD__))
-#include <malloc.h>  // this should never be needed but there are some reports that it is needed.
 #endif
 
 
