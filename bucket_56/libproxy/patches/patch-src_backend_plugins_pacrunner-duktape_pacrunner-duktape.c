--- src/backend/plugins/pacrunner-duktape/pacrunner-duktape.c.orig	2023-05-15 13:09:42 UTC
+++ src/backend/plugins/pacrunner-duktape/pacrunner-duktape.c
@@ -28,6 +28,10 @@
 #include <netdb.h>
 #endif
 
+#if defined(__FreeBSD__) || defined(__DragonFly__) || defined(__NetBSD__)
+#include <netinet/in.h>
+#endif
+
 #include "pacrunner-duktape.h"
 #include "pacutils.h"
 #include "px-plugin-pacrunner.h"
