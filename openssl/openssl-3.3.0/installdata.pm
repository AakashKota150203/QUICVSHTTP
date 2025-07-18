package OpenSSL::safe::installdata;

use strict;
use warnings;
use Exporter;
our @ISA = qw(Exporter);
our @EXPORT = qw($PREFIX
                  $BINDIR $BINDIR_REL
                  $LIBDIR $LIBDIR_REL
                  $INCLUDEDIR $INCLUDEDIR_REL
                  $APPLINKDIR $APPLINKDIR_REL
                  $ENGINESDIR $ENGINESDIR_REL
                  $MODULESDIR $MODULESDIR_REL
                  $PKGCONFIGDIR $PKGCONFIGDIR_REL
                  $CMAKECONFIGDIR $CMAKECONFIGDIR_REL
                  $VERSION @LDLIBS);

our $PREFIX             = '/home/Kota/quic-vs-http2-cdn/openssl-install';
our $BINDIR             = '/home/Kota/quic-vs-http2-cdn/openssl-install/bin';
our $BINDIR_REL         = 'bin';
our $LIBDIR             = '/home/Kota/quic-vs-http2-cdn/openssl-install/lib64';
our $LIBDIR_REL         = 'lib64';
our $INCLUDEDIR         = '/home/Kota/quic-vs-http2-cdn/openssl-install/include';
our $INCLUDEDIR_REL     = 'include';
our $APPLINKDIR         = '/home/Kota/quic-vs-http2-cdn/openssl-install/include/openssl';
our $APPLINKDIR_REL     = 'include/openssl';
our $ENGINESDIR         = '/home/Kota/quic-vs-http2-cdn/openssl-install/lib64/engines-3';
our $ENGINESDIR_REL     = 'lib64/engines-3';
our $MODULESDIR         = '/home/Kota/quic-vs-http2-cdn/openssl-install/lib64/ossl-modules';
our $MODULESDIR_REL     = 'lib64/ossl-modules';
our $PKGCONFIGDIR       = '/home/Kota/quic-vs-http2-cdn/openssl-install/lib64/pkgconfig';
our $PKGCONFIGDIR_REL   = 'lib64/pkgconfig';
our $CMAKECONFIGDIR     = '/home/Kota/quic-vs-http2-cdn/openssl-install/lib64/cmake/OpenSSL';
our $CMAKECONFIGDIR_REL = 'lib64/cmake/OpenSSL';
our $VERSION            = '3.3.0';
our @LDLIBS             =
    # Unix and Windows use space separation, VMS uses comma separation
    split(/ +| *, */, '-ldl -pthread ');

1;
