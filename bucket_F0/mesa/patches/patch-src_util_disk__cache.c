--- src/util/disk_cache.c.orig	2019-07-23 11:08:57 UTC
+++ src/util/disk_cache.c
@@ -51,6 +51,10 @@
 
 #include "disk_cache.h"
 
+#ifndef O_CLOEXEC
+#define O_CLOEXEC	0
+#endif
+
 /* Number of bits to mask off from a cache key to get an index. */
 #define CACHE_INDEX_KEY_BITS 16
 
