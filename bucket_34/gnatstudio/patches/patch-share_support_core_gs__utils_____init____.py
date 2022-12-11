Fix collections for Python 3.10+

--- share/support/core/gs_utils/__init__.py.orig	2022-05-11 12:25:42 UTC
+++ share/support/core/gs_utils/__init__.py
@@ -2,7 +2,7 @@
 # exported by GPS to make it easier to write plugins
 
 from GPS import pwd, cd, Action, EditorBuffer, MDI
-from collections import MutableMapping as DictMixin
+from collections.abc import MutableMapping as DictMixin
 import types
 import GPS
 import GPS.Browsers
