--- libarchive/archive_openssl_evp_private.h.orig	2017-10-01 00:17:22 UTC
+++ libarchive/archive_openssl_evp_private.h
@@ -28,7 +28,8 @@
 #include <openssl/evp.h>
 #include <openssl/opensslv.h>
 
-#if OPENSSL_VERSION_NUMBER < 0x10100000L
+#if OPENSSL_VERSION_NUMBER < 0x10100000L || \
+    (defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x2070000fL)
 #include <stdlib.h> /* malloc, free */
 #include <string.h> /* memset */
 static inline EVP_MD_CTX *EVP_MD_CTX_new(void)
