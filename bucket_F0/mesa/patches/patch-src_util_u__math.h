--- src/util/u_math.h.orig	2023-06-22 16:42:08 UTC
+++ src/util/u_math.h
@@ -59,6 +59,7 @@
 extern "C" {
 #endif
 
+#undef ALIGN
 
 #ifndef M_SQRT2
 #define M_SQRT2 1.41421356237309504880
