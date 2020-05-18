--- mesonbuild/linkers.py.orig	2020-05-15 07:23:18 UTC
+++ mesonbuild/linkers.py
@@ -1078,7 +1078,12 @@ class SolarisDynamicLinker(PosixDynamicL
     def get_link_whole_for(self, args: T.List[str]) -> T.List[str]:
         if not args:
             return args
-        return self._apply_prefix('--whole-archive') + args + self._apply_prefix('--no-whole-archive')
+        result = [self.prefix_arg + '-z', self.prefix_arg + 'allextract']
+        for a in args:
+            result.append(a)
+        result.append(self.prefix_arg + '-z')
+        result.append(self.prefix_arg + 'defaultextract')
+        return result
 
     def no_undefined_args(self) -> T.List[str]:
         return ['-z', 'defs']
