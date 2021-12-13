--- setup.py.orig	2021-12-06 18:23:39 UTC
+++ setup.py
@@ -58,7 +58,10 @@ with warnings.catch_warnings():
 TEST_EXTENSIONS = (sysconfig.get_config_var('TEST_MODULES') == 'yes')
 
 # This global variable is used to hold the list of modules to be disabled.
-DISABLED_MODULE_LIST = []
+try:
+    DISABLED_MODULE_LIST = sysconfig.get_config_var("DISABLED_EXTENSIONS").split(" ")
+except KeyError:
+    DISABLE_MODULE_LIST = []
 
 # --list-module-names option used by Tools/scripts/generate_module_names.py
 LIST_MODULE_NAMES = False
@@ -1104,8 +1107,6 @@ class PyBuildExt(build_ext):
         # use the same library for the readline and curses modules.
         if 'curses' in readline_termcap_library:
             curses_library = readline_termcap_library
-        elif self.compiler.find_library_file(self.lib_dirs, 'ncursesw'):
-            curses_library = 'ncursesw'
         # Issue 36210: OSS provided ncurses does not link on AIX
         # Use IBM supplied 'curses' for successful build of _curses
         elif AIX and self.compiler.find_library_file(self.lib_dirs, 'curses'):
@@ -1175,10 +1176,6 @@ class PyBuildExt(build_ext):
                 # for OS X but we need _XOPEN_SOURCE_EXTENDED here for
                 # ncurses wide char support
                 curses_defines.append(('_XOPEN_SOURCE_EXTENDED', '1'))
-        elif MACOS and curses_library == 'ncurses':
-            # Building with the system-suppied combined libncurses/libpanel
-            curses_defines.append(('HAVE_NCURSESW', '1'))
-            curses_defines.append(('_XOPEN_SOURCE_EXTENDED', '1'))
 
         curses_enabled = True
         if curses_library.startswith('ncurses'):
@@ -1660,7 +1657,7 @@ class PyBuildExt(build_ext):
             self.missing.extend(['resource', 'termios'])
 
         # Platform-specific libraries
-        if HOST_PLATFORM.startswith(('linux', 'freebsd', 'gnukfreebsd')):
+        if HOST_PLATFORM.startswith(('linux', 'dragonfly', 'freebsd', 'gnukfreebsd')):
             self.add(Extension('ossaudiodev', ['ossaudiodev.c']))
         elif not AIX:
             self.missing.append('ossaudiodev')
