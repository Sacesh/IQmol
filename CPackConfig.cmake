### Basic
string(TIMESTAMP SYSTEM_TIME "%Y%m%d%H%M%S")
set(CPACK_PACKAGE_NAME "IQmol")
#set(CPACK_PACKAGE_VERSION_MAJOR "2")
#set(CPACK_PACKAGE_VERSION_MINOR "9")
#set(CPACK_PACKAGE_VERSION_PATCH "3")
#set(CPACK_PACKAGE_VERSION "${CPACK_PACKAGE_VERSION_MAJOR}.${CPACK_PACKAGE_VERSION_MINOR}.${CPACK_PACKAGE_VERSION_PATCH}")
set(CPACK_PACKAGE_VERSION "${SYSTEM_TIME}")
set(CPACK_SYSTEM_NAME "${CMAKE_SYSTEM_NAME}")
set(CPACK_PACKAGE_FILE_NAME "${CPACK_PACKAGE_NAME}-${CPACK_PACKAGE_VERSION}")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "A molecule editor and visualization package")
set(CPACK_PACKAGE_VENDOR "IQmol.org")
set(CPACK_PACKAGE_CONTACT "Andrew Gilbert")
set(CPACK_PACKAGE_INSTALL_DIRECTORY "${CPACK_PACKAGE_NAME}-${CPACK_PACKAGE_VERSION}")
set(CPACK_PACKAGE_FILE_NAME "${CPACK_PACKAGE_NAME}-${CPACK_PACKAGE_VERSION}")

### Generator
if(APPLE)
    set(CPACK_GENERATOR "Bundle")
elseif(UNIX)
    set(CPACK_GENERATOR "DEB")
elseif(WIN32)
    set(CPACK_GENERATOR "WIX")
else()
    set(CPACK_GENERATOR "TGZ")
endif()

set(IQMOL_SOURCE_DIR $ENV{PWD})
message("IQmol source directory: ${IQMOL_SOURCE_DIR}")

# cpack_installed_directories "/full/path;subdir"
# => subdir/files_in_full_path
if(UNIX)
    set(CPACK_INSTALLED_DIRECTORIES "${IQMOL_SOURCE_DIR}/deploy;usr") 
else()
    set(CPACK_INSTALLED_DIRECTORIES "${IQMOL_SOURCE_DIR}/deploy;.") 
    set(CPACK_PACKAGE_FILE_NAME "${CPACK_PACKAGE_NAME}-${CPACK_PACKAGE_VERSION}-windows-installer")
endif()

# cpack_packaing_install_prefix "prefix"
# tgz => cpack_package_file_name/prefix/subdir/files_in_full_path
# nsis => 
#set(CPACK_PACKAGING_INSTALL_PREFIX "/tmp/cpacktest")

## macOS
set(CPACK_BUNDLE_NAME "${CPACK_PACKAGE_NAME}-${CPACK_PACKAGE_VERSION}")
set(CPACK_BUNDLE_PLIST "${IQMOL_SOURCE_DIR}/src/Main/resources/Info.plist")
set(CPACK_BUNDLE_ICON "${IQMOL_SOURCE_DIR}/src/Main/resources/IQmol.icns")

### Windows
set(CPACK_PACKAGE_DESCRIPTION_FILE "${IQMOL_SOURCE_DIR}/README")
set(CPACK_RESOURCE_FILE_LICENSE "${IQMOL_SOURCE_DIR}/LICENSE")
set(CPACK_PACKAGE_EXECUTABLES "iqmol;IQmol") # link in Start Menu
set(CPACK_CREATE_DESKTOP_LINKS "iqmol;IQmol")
# WiX
set(CPACK_WIX_SIZEOF_VOID_P 4)	# 32-bit
set(CPACK_RESOURCE_FILE_LICENSE "${IQMOL_SOURCE_DIR}/LICENSE.txt")
set(CPACK_WIX_PROGRAM_MENU_FOLDER "${CPACK_PACKAGE_NAME}-${CPACK_PACKAGE_VERSION}")
set(CPACK_WIX_PRODUCT_ICON "${IQMOL_SOURCE_DIR}/src/Main/resources/IQmol.ico") 
set(CPACK_WIX_UI_BANNER "${IQMOL_SOURCE_DIR}/src/Main/resources/Installer-header.bmp")
set(CPACK_WIX_UI_DIALOG "${IQMOL_SOURCE_DIR}/src/Main/resources/Installer-lhs.bmp")

### Debian
set(CPACK_DEBIAN_PACKAGE_MAINTAINER "Andrew Gilbert")
set(CPACK_DEBIAN_PACKAGE_DEPENDS "qt5-default")

# ???
#set(CPACK_STRIP_FILES "bin/iqmol;IQmol")
