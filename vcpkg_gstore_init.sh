#/bin/bash

sed -i 's#https://github.com/#https://hub.gitmirror.com/https://github.com/#g' scripts/bootstrap.sh \
    && sed -i 's#https://github.com/#https://hub.gitmirror.com/https://github.com/#g' scripts/vcpkg-tools.json \
    && sed -z -i 's|    vcpkg_list(SET params "x-download" "${arg_FILENAME}")\n    foreach(url IN LISTS arg_URLS)\n        vcpkg_list(APPEND params "--url=${url}")\n    endforeach()\n|    vcpkg_list(SET params "x-download" "${arg_FILENAME}")\n    vcpkg_list(SET arg_URLS_Real)\n    foreach(url IN LISTS arg_URLS)\n        string(REPLACE "http://download.savannah.nongnu.org/releases/gta/" "https://marlam.de/gta/releases/" url "${url}")\n        string(REPLACE "https://github.com/" "https://hub.gitmirror.com/https://github.com/" url "${url}")\n        string(REPLACE "https://ftp.gnu.org/" "https://mirrors.aliyun.com/" url "${url}")\n        string(REPLACE "https://raw.githubusercontent.com/" "https://ghfast.top/https://raw.githubusercontent.com/" url "${url}")\n        string(REPLACE "http://ftp.gnu.org/pub/gnu/" "https://mirrors.aliyun.com/gnu/" url "${url}")\n        string(REPLACE "https://ftp.postgresql.org/pub/" "https://mirrors.tuna.tsinghua.edu.cn/postgresql/" url "${url}")\n        string(REPLACE "https://support.hdfgroup.org/ftp/lib-external/szip/2.1.1/src/" "https://distfiles.macports.org/szip/" url "${url}")\n        vcpkg_list(APPEND params "--url=${url}")\n        vcpkg_list(APPEND arg_URLS_Real "${url}")\n    endforeach()\n    if(NOT vcpkg_download_distfile_QUIET)\n        message(STATUS "Downloading ${arg_URLS_Real} -> ${arg_FILENAME}...")\n    endif()|g' scripts/cmake/vcpkg_download_distfile.cmake

#windows
sed -i 's#https://github.com/#https://hub.gitmirror.com/https://github.com/#g' scripts/update-vcpkg-tool-metadata.ps1
./bootstrap-vcpkg.sh

