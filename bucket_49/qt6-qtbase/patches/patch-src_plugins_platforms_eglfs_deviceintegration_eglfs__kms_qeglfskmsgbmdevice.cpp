--- src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmdevice.cpp.orig	2022-09-19 10:23:04 UTC
+++ src/plugins/platforms/eglfs/deviceintegration/eglfs_kms/qeglfskmsgbmdevice.cpp
@@ -13,6 +13,10 @@
 
 #define ARRAY_LENGTH(a) (sizeof (a) / sizeof (a)[0])
 
+#ifndef O_CLOEXEC
+#define O_CLOEXEC 0
+#endif
+
 QT_BEGIN_NAMESPACE
 
 Q_DECLARE_LOGGING_CATEGORY(qLcEglfsKmsDebug)
