--- src/GLdispatch/vnd-glapi/glapi.h.orig	2022-08-22 13:02:53 UTC
+++ src/GLdispatch/vnd-glapi/glapi.h
@@ -88,7 +88,7 @@ enum {
  */
 _GLAPI_EXPORT extern const __thread void *
     _glapi_tls_Current[GLAPI_NUM_CURRENT_ENTRIES]
-#if defined(__GLIBC__) || defined(__FreeBSD__)
+#if defined(__GLIBC__) || defined(__FreeBSD__) || defined(__DragonFly__)
     __attribute__((tls_model("initial-exec")))
 #endif
     ;
