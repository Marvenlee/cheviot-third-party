cmake_minimum_required(VERSION 3.5)

include(ExternalProject)

ExternalProject_Add (
  less
  URL               https://ftp.gnu.org/gnu/less/less-590.tar.gz
  PREFIX            ${CMAKE_CURRENT_BINARY_DIR}/output
  SOURCE_DIR        ${CMAKE_CURRENT_BINARY_DIR}/third-party/less-590
  PATCH_COMMAND     patch -s -p2 --forward --input=${CMAKE_CURRENT_SOURCE_DIR}/third-party/patches/less-590.patch	
  CONFIGURE_COMMAND ${CMAKE_CURRENT_BINARY_DIR}/third-party/less-590/configure --host=arm-none-eabi
	                    --prefix=${CMAKE_CURRENT_BINARY_DIR}/build/host
                      CFLAGS=-D_POSIX_VERSION host_alias=arm-none-eabi
                      LDLIBS="-lcurses -ltermcap"
  DEPENDS           newlib libs
  BUILD_ALWAYS      OFF
  INSTALL_DIR       ${CMAKE_CURRENT_BINARY_DIR}/build/host/
  BUILD_COMMAND     make
  INSTALL_COMMAND   pseudo make install
)

