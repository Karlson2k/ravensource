--- scripts/wsrep_sst_mariabackup.sh.orig	2020-05-08 11:45:23 UTC
+++ scripts/wsrep_sst_mariabackup.sh
@@ -606,7 +606,7 @@ recv_joiner()
     set +e
 
     if [[ $tmt -gt 0 ]] && command -v timeout >/dev/null;then
-        if timeout --help | grep -q -- '-k';then 
+        if timeout --help 2>&1 | grep -q -- '-k';then 
             ltcmd="timeout -k $(( tmt+10 )) $tmt $tcmd"
         else 
             ltcmd="timeout -s9 $tmt $tcmd"
