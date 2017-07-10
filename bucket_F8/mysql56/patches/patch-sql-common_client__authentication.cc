--- sql-common/client_authentication.cc.orig	2017-07-10 12:34:21 UTC
+++ sql-common/client_authentication.cc
@@ -84,7 +84,7 @@ RSA *rsa_init(MYSQL *mysql)
 
   if (mysql->options.extension != NULL &&
       mysql->options.extension->server_public_key_path != NULL &&
-      mysql->options.extension->server_public_key_path != '\0')
+      *mysql->options.extension->server_public_key_path != '\0')
   {
     pub_key_file= fopen(mysql->options.extension->server_public_key_path,
                         "r");
