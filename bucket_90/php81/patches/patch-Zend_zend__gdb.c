--- Zend/zend_gdb.c.orig	2023-11-21 21:53:48 UTC
+++ Zend/zend_gdb.c
@@ -25,7 +25,9 @@
 #include <fcntl.h>
 #include <unistd.h>
 
-#if defined(__FreeBSD__) && __FreeBSD_version >= 1100000
+#if defined(__MidnightBSD__)
+# include <sys/user.h>
+#elif defined(__FreeBSD__) && __FreeBSD_version >= 1100000
 # include <sys/user.h>
 # include <libutil.h>
 #endif
