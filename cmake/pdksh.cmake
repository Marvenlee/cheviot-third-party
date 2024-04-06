# pdksh-5.2.12.tar.gz

set(PDKSH_LIBS "-lc -ldb -lutil -lc")

ExternalProject_Add (
	pdksh
  URL               http://ftp.lip6.fr/pub/unix/shells/pdksh/pdksh-5.2.12.tar.gz
	PREFIX            ${CMAKE_CURRENT_BINARY_DIR}/output
	SOURCE_DIR        ${CMAKE_CURRENT_BINARY_DIR}/third-party/pdksh-5.2.12/
	PATCH_COMMAND     patch -s -p2 --forward --input=${CMAKE_CURRENT_SOURCE_DIR}/third-party/patches/pdksh-5.2.12.patch	
	CONFIGURE_COMMAND ${CMAKE_CURRENT_BINARY_DIR}/third-party/pdksh-5.2.12/configure --host=arm-none-eabi
	                    --prefix=${CMAKE_CURRENT_BINARY_DIR}/build/host/
                      LIBS=${PDKSH_LIBS}
	BUILD_ALWAYS      OFF
	INSTALL_DIR       ${CMAKE_CURRENT_BINARY_DIR}/build/host/
	DEPENDS           newlib
	BUILD_COMMAND     make
	INSTALL_COMMAND   pseudo make install
)


