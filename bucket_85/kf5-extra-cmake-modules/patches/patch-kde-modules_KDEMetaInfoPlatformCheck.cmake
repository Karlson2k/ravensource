--- kde-modules/KDEMetaInfoPlatformCheck.cmake.orig	2023-01-12 21:43:20 UTC
+++ kde-modules/KDEMetaInfoPlatformCheck.cmake
@@ -46,6 +46,18 @@ if (NOT "${KF_IGNORE_PLATFORM_CHECK}")
                 if (CMAKE_SYSTEM_NAME MATCHES "OpenBSD")
                     set(_MetainfoFoundSupportedPlatform true)
                 endif()
+            elseif (${CMAKE_MATCH_1} STREQUAL "DragonFly")
+                if (CMAKE_SYSTEM_NAME MATCHES "DragonFly")
+                    set(_MetainfoFoundSupportedPlatform true)
+                endif()
+            elseif (${CMAKE_MATCH_1} STREQUAL "NetBSD")
+                if (CMAKE_SYSTEM_NAME MATCHES "NetBSD")
+                    set(_MetainfoFoundSupportedPlatform true)
+                endif()
+            elseif (${CMAKE_MATCH_1} STREQUAL "MidnightBSD")
+                if (CMAKE_SYSTEM_NAME MATCHES "MidnightBSD")
+                    set(_MetainfoFoundSupportedPlatform true)
+                endif()
             elseif (${CMAKE_MATCH_1} STREQUAL "Windows")
                 if (WIN32)
                     set(_MetainfoFoundSupportedPlatform true)
