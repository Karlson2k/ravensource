# RESERVED_WARNING
# Provide default versions for ports with multiple versions selectable
# by the user.
#
# Users who want to override these defaults can easily do so by defining
# DEFAULT_VERSIONS in their make.conf as follows:
#
# DEFAULT_VERSIONS=	perl5=5.20 ruby=2.0
#

.if !defined(_INCLUDE_BSD_DEFAULT_VERSIONS_MK)
_INCLUDE_BSD_DEFAULT_VERSIONS_MK=	yes

.  for base in FIREBIRD LUA MYSQL PERL5 PHP PGSQL PYTHON3 RUBY SSL TCL
.undef ${base}_DEFAULT
.  endfor

.  for base in ${DEFAULT_VERSIONS}
_l=			${base:C/=.*//g}
${_l:tu}_DEFAULT=	${base:C/.*=//g}
.  endfor

#-------------------------------------------------------------------------
# PERL5
# Possible values: 5.30 and 5.32
#-------------------------------------------------------------------------

PERL5_DEFAULT?=		5.30

PERL_5.30_VERSION=	5.30.3
PERL_5.32_VERSION=	5.32.1

#-------------------------------------------------------------------------
# RUBY
# Possible values: 2.6, 2.7, 3.0
#-------------------------------------------------------------------------

RUBY_DEFAULT?=		2.7

RUBY_2.6_VERSION=	2.6.6
RUBY_2.7_VERSION=	2.7.2
RUBY_3.0_VERSION=	3.0.0

#-------------------------------------------------------------------------
# PYTHON
# Possible values: 2.7, 3.8, 3.9
#-------------------------------------------------------------------------

PYTHON3_DEFAULT?=	3.8

PYTHON_2.7_VERSION=	2.7.18
PYTHON_3.8_VERSION=	3.8.7
PYTHON_3.9_VERSION=	3.9.1

#-------------------------------------------------------------------------
# SSL
# Possible values: openssl, openssl-devel, libressl, libressl-devel
#-------------------------------------------------------------------------

SSL_DEFAULT?=		libressl

#-------------------------------------------------------------------------
# LUA
# Possible values: 5.2, 5.3, 5.4
#-------------------------------------------------------------------------

LUA_DEFAULT?=		5.3

LUA_5.2_VERSION=	5.2.4
LUA_5.3_VERSION=	5.3.6
LUA_5.4_VERSION=	5.4.2

#-------------------------------------------------------------------------
# TCL/TK
# Possible values: 8.5, 8.6
#-------------------------------------------------------------------------

TCL_DEFAULT?=		8.6

TCL_8.5_VERSION=	8.5.19
TCL_8.6_VERSION=	8.6.11

#-------------------------------------------------------------------------
# PGSQL
# Possible values: 9.6, 10, 11, 12, 13
#-------------------------------------------------------------------------

PGSQL_DEFAULT?=		12

PGSQL_9.6_VERSION=	9.6.20
PGSQL_10_VERSION=	10.15
PGSQL_11_VERSION=	11.10
PGSQL_12_VERSION=	12.5
PGSQL_13_VERSION=	13.1

#-------------------------------------------------------------------------
# MYSQL and derivatives
# Possible values: oracle-(5.6,5.7,8.0), mariadb-(10.2,10.3,10.4),
#                  percona-(5.5,5.6,5.7), galera-(5.5,5.6,5.7)
#-------------------------------------------------------------------------

MYSQL_DEFAULT=			oracle-8.0

MYSQL_oracle-8.0_VERSION=	8.0.22
MYSQL_oracle-5.7_VERSION=	5.7.32
MYSQL_oracle-5.6_VERSION=	5.6.50
MYSQL_mariadb-10.2_VERSION=	10.2.36
MYSQL_mariadb-10.3_VERSION=	10.3.27
MYSQL_mariadb-10.4_VERSION=	10.4.17
MYSQL_mariadb-10.5_VERSION=	10.5.8
MYSQL_percona-5.7_VERSION=	5.7.17
MYSQL_percona-5.6_VERSION=	5.6.35
MYSQL_percona-5.5_VERSION=	5.5.54

#-------------------------------------------------------------------------
# Firebird database server
# Possible values: 2.5, 3.0
#-------------------------------------------------------------------------

FIREBIRD_DEFAULT?=	2.5

FIREBIRD_2.5_VERSION=	2.5.8
FIREBIRD_3.0_VERSION=	3.0.7

#-------------------------------------------------------------------------
# PHP (restricted to branches still receiving updates)
# Possible values: 7.3, 7.4, 8.0
#-------------------------------------------------------------------------

PHP_DEFAULT?=		7.4

PHP_7.3_VERSION=	7.3.26
PHP_7.4_VERSION=	7.4.14
PHP_8.0_VERSION=	8.0.1

#-------------------------------------------------------------------------
# Ravenports system root versions per platform
# Format: ID=opsys/arch/stdarch/os-version/os-release/os-major
#-------------------------------------------------------------------------

PLATFORM_FreeBSD_x86-64=	FreeBSD/amd64/x86_64/1202000/12.2/12
PLATFORM_DragonFly_x86-64=	DragonFly/x86_64/x86_64/500800/5.8/5.8
PLATFORM_Linux_x86-64=		Linux/x86_64/x86_64/440053/4.4.0/4.4
PLATFORM_SunOS_x86-64=		SunOS/x86_64/x86_64/510200910/5.10/5.10
PLATFORM_MacOS_x86-64=		Darwin/x86_64/x86_64/170700/17.7.0/17
PLATFORM_NetBSD_x86-64=		NetBSD/amd64/x86_64/tbd/tbd/tbd
PLATFORM_OpenBSD_x86-64=	OpenBSD/amd64/x86_64/tbd/tbd/tbd

.endif # defined (_INCLUDE_BSD_DEFAULT_VERSIONS_MK)
