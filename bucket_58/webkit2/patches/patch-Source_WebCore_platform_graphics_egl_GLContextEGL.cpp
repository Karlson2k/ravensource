--- Source/WebCore/platform/graphics/egl/GLContextEGL.cpp.orig	2018-03-21 23:57:43 UTC
+++ Source/WebCore/platform/graphics/egl/GLContextEGL.cpp
@@ -45,6 +45,8 @@
 #include "OpenGLShims.h"
 #endif
 
+#include <X11/Xlib.h>
+
 #if ENABLE(ACCELERATED_2D_CANVAS)
 // cairo-gl.h includes some definitions from GLX that conflict with
 // the ones provided by us. Since GLContextEGL doesn't use any GLX
