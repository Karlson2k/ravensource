--- extern/icu/source/common/putil.c.orig	2019-06-17 15:15:52 UTC
+++ extern/icu/source/common/putil.c
@@ -43,9 +43,8 @@
 #ifndef PTX
 
 /* Define _XOPEN_SOURCE for Solaris and friends. */
-/* NetBSD needs it to be >= 4 */
-#ifndef _XOPEN_SOURCE
-#define _XOPEN_SOURCE 4
+#ifdef __sun__
+#define __EXTENSIONS__
 #endif
 
 #if defined(DARWIN)
