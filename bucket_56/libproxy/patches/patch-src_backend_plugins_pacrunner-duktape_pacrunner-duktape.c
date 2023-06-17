--- src/backend/plugins/pacrunner-duktape/pacrunner-duktape.c.orig	2023-06-16 15:00:03 UTC
+++ src/backend/plugins/pacrunner-duktape/pacrunner-duktape.c
@@ -29,6 +29,10 @@
 #include <netinet/in.h>
 #endif
 
+#if defined(__FreeBSD__) || defined(__DragonFly__) || defined(__NetBSD__)
+#include <netinet/in.h>
+#endif
+
 #include "pacrunner-duktape.h"
 #include "pacutils.h"
 #include "px-plugin-pacrunner.h"
