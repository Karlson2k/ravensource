--- src/gallium/winsys/svga/drm/vmw_screen_ioctl.c.orig	2020-03-18 21:24:19 UTC
+++ src/gallium/winsys/svga/drm/vmw_screen_ioctl.c
@@ -694,7 +694,9 @@ vmw_ioctl_region_map(struct vmw_region *
 	 return NULL;
       }
 
+#ifdef __linux__
       (void) madvise(map, region->size, MADV_HUGEPAGE);
+#endif
       region->data = map;
    }
 
