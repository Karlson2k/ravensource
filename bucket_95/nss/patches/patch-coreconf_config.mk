--- coreconf/config.mk.orig	2024-01-22 08:56:12 UTC
+++ coreconf/config.mk
@@ -31,7 +31,7 @@ endif
 #######################################################################
 
 TARGET_OSES = FreeBSD BSD_OS NetBSD OpenUNIX OS2 QNX Darwin OpenBSD \
-              AIX RISCOS WINNT WIN95 Linux Android
+              AIX RISCOS WINNT WIN95 Linux Android DragonFly MidnightBSD
 
 ifeq (,$(filter-out $(TARGET_OSES),$(OS_TARGET)))
 include $(CORE_DEPTH)/coreconf/$(OS_TARGET).mk
