--- Utilities/cmcurl/lib/curl_setup.h.orig	2023-08-16 17:46:35 UTC
+++ Utilities/cmcurl/lib/curl_setup.h
@@ -24,6 +24,7 @@
  *
  ***************************************************************************/
 
+#define __BSD_VISIBLE 1
 #if defined(BUILDING_LIBCURL) && !defined(CURL_NO_OLDIES)
 #define CURL_NO_OLDIES
 #endif
