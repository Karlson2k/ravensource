--- util/perl/OpenSSL/config.pm.orig	2023-10-24 13:41:51 UTC
+++ util/perl/OpenSSL/config.pm
@@ -132,6 +132,7 @@ my $guess_patterns = [
           return "${hw}-whatever-netbsd";
       }
     ],
+    [ 'MidnightBSD:.*',             '${MACHINE}-whatever-midnightbsd' ],
     [ 'NetBSD:.*',                  '${MACHINE}-whatever-netbsd' ],
     [ 'OpenBSD:.*',                 '${MACHINE}-whatever-openbsd' ],
     [ 'OpenUNIX:.*',                '${MACHINE}-unknown-OpenUNIX${VERSION}' ],
@@ -756,20 +757,7 @@ EOF
       [ 'sun4.*-.*-solaris2',     { target => "solaris-sparcv7" } ],
       [ '.*86.*-.*-solaris2',
         sub {
-            my $KERNEL_BITS = $ENV{KERNEL_BITS};
-            my $ISA64 = `isainfo 2>/dev/null | grep amd64`;
-            my $KB = $KERNEL_BITS // '64';
-            if ($ISA64 ne "" && $KB eq '64') {
-                return { target => "solaris64-x86_64-gcc" } if $CCVENDOR eq "gnu";
-                return { target => "solaris64-x86_64-cc" };
-            }
-            my $REL = uname('-r');
-            $REL =~ s/5\.//;
-            my @tmp_disable = ();
-            push @tmp_disable, 'sse2' if int($REL) < 10;
-            #There is no solaris-x86-cc target
-            return { target => "solaris-x86-gcc",
-                     disable => [ @tmp_disable ] };
+            return { target => "solaris64-x86_64-gcc" };
         }
       ],
       # We don't have any sunos target in Configurations/*.conf, so why here?
@@ -786,6 +774,8 @@ EOF
       [ 'sparc64-.*-.*bsd.*',     { target => "BSD-sparc64" } ],
       [ 'ia64-.*-.*bsd.*',        { target => "BSD-ia64" } ],
       [ 'x86_64-.*-dragonfly.*',  { target => "BSD-x86_64" } ],
+      [ 'x86_64-.*-midnightbsd.*',{ target => "BSD-x86_64" } ],
+      [ 'x86_64-.*-netbsd.*',     { target => "BSD-x86_64" } ],
       [ 'amd64-.*-.*bsd.*',       { target => "BSD-x86_64" } ],
       [ 'arm64-.*-.*bsd.*',       { target => "BSD-aarch64" } ],
       [ 'armv6-.*-.*bsd.*',       { target => "BSD-armv4" } ],
