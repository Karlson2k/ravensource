--- coreconf/ruleset.mk.orig	2024-01-22 08:56:12 UTC
+++ coreconf/ruleset.mk
@@ -30,7 +30,7 @@
 #
 
 ifndef COMPILER_TAG
-    ifneq ($(DEFAULT_COMPILER), $(notdir $(firstword $(CC))))
+    ifneq ($(DEFAULT_COMPILER), $(CC))
 #
 # Temporary define for the Client; to be removed when binary release is used
 #
