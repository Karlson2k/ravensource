--- src/intel/isl/isl.h.orig	2021-10-14 19:59:05 UTC
+++ src/intel/isl/isl.h
@@ -48,6 +48,9 @@
 #include "util/format/u_format.h"
 
 #ifdef __cplusplus
+# ifdef __sun__
+# define restrict	__restrict__
+# endif
 extern "C" {
 #endif
 
