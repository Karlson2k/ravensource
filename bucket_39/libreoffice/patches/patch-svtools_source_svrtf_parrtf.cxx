--- svtools/source/svrtf/parrtf.cxx.orig	2023-08-23 11:52:34 UTC
+++ svtools/source/svrtf/parrtf.cxx
@@ -51,6 +51,7 @@ SvRTFParser::~SvRTFParser()
 {
 }
 
+#include <cstdio>
 
 int SvRTFParser::GetNextToken_()
 {
