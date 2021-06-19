--- include/pcm.h.orig	2021-06-14 10:28:44 UTC
+++ include/pcm.h
@@ -29,6 +29,13 @@
 #ifndef __ALSA_PCM_H
 #define __ALSA_PCM_H
 
+#ifndef ESTRPIPE
+#define ESTRPIPE EPIPE
+#endif
+#ifndef EBADFD
+#define EBADFD EBADF
+#endif
+
 #ifdef __cplusplus
 extern "C" {
 #endif
