--- Source/WTF/wtf/NumberOfCores.cpp.orig	2018-10-27 21:20:57 UTC
+++ Source/WTF/wtf/NumberOfCores.cpp
@@ -35,6 +35,7 @@
 #include <sys/types.h>
 #include <sys/sysctl.h>
 #elif OS(LINUX) || OS(AIX) || OS(OPENBSD) || OS(NETBSD) || OS(FREEBSD)
+#include <stdio.h> // sscanf
 #include <unistd.h>
 #elif OS(WINDOWS)
 #include <windows.h>
