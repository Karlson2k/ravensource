--- test/midifile.c.orig	2021-06-14 10:28:44 UTC
+++ test/midifile.c
@@ -71,7 +71,7 @@
 #endif
 
 #include <stdio.h>
-#include <values.h>
+#include <limits.h>
 
 #include <string.h>
 /*void exit(), free();*/
@@ -328,7 +328,7 @@ readtrack ()			/* read a track chunk */
 
   if (Mf_interactive)
     {
-      Mf_toberead = MAXINT;
+      Mf_toberead = INT_MAX;
     }
   else
     {
