--- sdext/source/pdfimport/xpdfwrapper/pdfioutdev_gpl.cxx.orig	2020-05-13 11:19:20 UTC
+++ sdext/source/pdfimport/xpdfwrapper/pdfioutdev_gpl.cxx
@@ -563,7 +563,9 @@ void PDFOutDev::processLink(Link* link,
     if (!(pAction && pAction->getKind() == actionURI))
         return;
 
-#if POPPLER_CHECK_VERSION(0, 72, 0)
+#if POPPLER_CHECK_VERSION(0, 86, 0)
+    const char* pURI = static_cast<LinkURI*>(pAction)->getURI().c_str();
+#elif POPPLER_CHECK_VERSION(0, 72, 0)
     const char* pURI = static_cast<LinkURI*>(pAction)->getURI()->c_str();
 #else
     const char* pURI = static_cast<LinkURI*>(pAction)->getURI()->getCString();
