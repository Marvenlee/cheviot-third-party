#! /bin/sh
# 
# mk-patch.sh
#
# A script to generate third-party/patches of third party software.
#
# Extract the archives of the original software into a directory labelled build/third-party-original
# The original sources (with patch changes) are extracted into the build/third-party folder by
# the build process.
#
# TODO: Improve mechanism to create third-party/patches
# FIXME: Assumes "build" directory is created within the project's base directory

if [ ! -f "setup-env.sh" ]; then
  echo "Error: mk-patch.sh should only be run from the project's base directory."
fi

mkdir -p build/third-party-original

tar xf build/output/src/coreutils-5.2.1.tar.bz2 -C build/third-party-original/
tar xf build/output/src/pdksh-5.2.12.tar.gz -C build/third-party-original/
tar xf build/output/src/libtask-20121021.tgz -C build/third-party-original/
tar xf build/output/src/less-590.tar.gz -C build/third-party-original/

diff -aurN build/third-party-original/coreutils-5.2.1 build/third-party/coreutils-5.2.1 >third-party/patches/coreutils-5.2.1.patch
diff -aurN build/third-party-original/pdksh-5.2.12 build/third-party/pdksh-5.2.12 >third-party/patches/pdksh-5.2.12.patch
diff -aurN build/third-party-original/libtask build/third-party/libtask >third-party/patches/libtask.patch
diff -aurN build/third-party-original/less-590 build/third-party/less-590 >third-party/patches/less-590.patch


