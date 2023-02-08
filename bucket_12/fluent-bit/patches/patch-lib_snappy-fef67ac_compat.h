--- lib/snappy-fef67ac/compat.h.orig	2023-02-01 17:09:22 UTC
+++ lib/snappy-fef67ac/compat.h
@@ -4,6 +4,8 @@
 
 #ifdef __FreeBSD__
 #  include <sys/endian.h>
+#elif defined __DragonFly__
+#  include <sys/endian.h>
 #elif defined(__APPLE_CC_) || defined(__MACH__)  /* MacOS/X support */
 #  include <machine/endian.h>
 
