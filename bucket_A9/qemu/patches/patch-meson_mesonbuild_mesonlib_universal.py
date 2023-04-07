--- meson/mesonbuild/mesonlib/universal.py.orig	2023-04-05 20:11:08 UTC
+++ meson/mesonbuild/mesonlib/universal.py
@@ -658,7 +658,7 @@ def is_netbsd() -> bool:
 
 
 def is_freebsd() -> bool:
-    return platform.system().lower() == 'freebsd'
+    return platform.system().lower() in ('freebsd', 'midnightbsd')
 
 def is_irix() -> bool:
     return platform.system().startswith('irix')
