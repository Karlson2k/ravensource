--- sapi/apache2handler/config.m4.orig	2017-07-05 22:25:00 UTC
+++ sapi/apache2handler/config.m4
@@ -67,7 +67,7 @@ if test "$PHP_APXS2" != "no"; then
   fi
 
   APXS_LIBEXECDIR='$(INSTALL_ROOT)'`$APXS -q LIBEXECDIR`
-  if test -z `$APXS -q SYSCONFDIR`; then
+  if true; then
     INSTALL_IT="\$(mkinstalldirs) '$APXS_LIBEXECDIR' && \
                  $APXS -S LIBEXECDIR='$APXS_LIBEXECDIR' \
                        -i -n php5"
