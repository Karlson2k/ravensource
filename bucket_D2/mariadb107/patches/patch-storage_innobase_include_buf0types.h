--- storage/innobase/include/buf0types.h.orig	2021-11-05 20:29:29 UTC
+++ storage/innobase/include/buf0types.h
@@ -189,10 +189,8 @@ public:
   /** Acquire an exclusive lock */
   inline void lock();
 
-#ifdef UNIV_DEBUG
   /** @return whether an exclusive lock is being held by any thread */
   bool is_write_locked() const { return rw_lock::is_write_locked(); }
-#endif
 
   /** @return whether any lock is being held by any thread */
   bool is_locked() const { return rw_lock::is_locked(); }
