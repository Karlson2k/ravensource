--- src/nvim/os/os_defs.h.orig	2021-07-02 15:54:29 UTC
+++ src/nvim/os/os_defs.h
@@ -13,6 +13,10 @@
 # include "nvim/os/unix_defs.h"
 #endif
 
+#ifdef __sun__
+#define NAME_MAX	255
+#endif
+
 #define BASENAMELEN (NAME_MAX - 5)
 
 // Use the system path length if it makes sense.
