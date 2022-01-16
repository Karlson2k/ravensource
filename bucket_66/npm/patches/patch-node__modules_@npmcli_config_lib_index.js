--- node_modules/@npmcli/config/lib/index.js.orig	2022-01-13 20:16:49 UTC
+++ node_modules/@npmcli/config/lib/index.js
@@ -330,6 +330,9 @@ class Config {
 
     if (this.env.PREFIX) {
       this.globalPrefix = this.env.PREFIX
+      if (this.env.DESTDIR) {
+        this.globalPrefix = join(this.env.DESTDIR, this.globalPrefix)
+      }
     } else if (this.platform === 'win32') {
     // c:\node\node.exe --> prefix=c:\node\
       this.globalPrefix = dirname(this.execPath)
