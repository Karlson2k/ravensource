--- deps/uv/common.gypi.orig	2023-09-07 12:46:27 UTC
+++ deps/uv/common.gypi
@@ -135,7 +135,7 @@
           }]
         ]
       }],
-      ['OS in "freebsd dragonflybsd linux openbsd solaris android aix os400"', {
+      ['OS in "freebsd dragonflybsd linux openbsd netbsd solaris android aix os400"', {
         'cflags': [ '-Wall' ],
         'cflags_cc': [ '-fno-rtti', '-fno-exceptions' ],
         'target_conditions': [
