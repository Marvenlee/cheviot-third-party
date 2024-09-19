cmake_minimum_required(VERSION 3.5)

include(ExternalProject)

ExternalProject_Add (
	dtc
	GIT_REPOSITORY    https://github.com/dgibson/dtc.git
	GIT_TAG           99031e3a4a6e479466ae795790b44727434ca27d
	PREFIX            ${CMAKE_CURRENT_BINARY_DIR}/output
	SOURCE_DIR        ${CMAKE_CURRENT_BINARY_DIR}/third-party/dtc
	UPDATE_DISCONNECTED true
	PATCH_COMMAND     patch -s -p2 --forward --input=${CMAKE_CURRENT_SOURCE_DIR}/third-party/patches/dtc.patch
	                  && chmod +x ${CMAKE_CURRENT_BINARY_DIR}/third-party/dtc/configure		
	CONFIGURE_COMMAND ${CMAKE_CURRENT_BINARY_DIR}/third-party/dtc/configure --host=arm-none-eabi
	                    --prefix=${CMAKE_CURRENT_BINARY_DIR}/build/native/
	                    --includedir=${CMAKE_CURRENT_BINARY_DIR}/build/native/arm-none-eabi/include/
	                    --libdir=${CMAKE_CURRENT_BINARY_DIR}/build/native/arm-none-eabi/lib/
	BUILD_ALWAYS      OFF
	DEPENDS           newlib
	INSTALL_DIR       ${CMAKE_CURRENT_BINARY_DIR}/build/native/
	BUILD_COMMAND     make
	INSTALL_COMMAND   make install

)

#
