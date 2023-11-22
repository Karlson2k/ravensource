https://github.com/mesonbuild/meson/pull/4324

--- unittests/linuxliketests.py.orig	2023-11-12 18:41:00 UTC
+++ unittests/linuxliketests.py
@@ -1588,7 +1588,7 @@ class LinuxlikeTests(BasePlatformTests):
         # Test that installed libraries works
         self.new_builddir()
         self.prefix = oldprefix
-        meson_args = [f'-Dc_link_args=-L{libdir}',
+        meson_args = [f'-Dc_link_args=-L{libdir} -Wl,-rpath,{libdir}',
                       '--fatal-meson-warnings']
         testdir = os.path.join(self.unit_test_dir, '66 static link')
         env = {'PKG_CONFIG_LIBDIR': os.path.join(libdir, 'pkgconfig')}
