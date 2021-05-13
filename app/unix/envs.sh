#================================================
export "GPROJECT_ROOT=/home/rpi4/Programs"
export "GPROJECT_PATH=${GPROJECT_ROOT}/ReadyRPI"
export "GPROJECT_APP=${GPROJECT_PATH}/app"
#================================================
export "GYOCTO_IMG_SD=/dev/sda"
export "GYOCTO_BRANCH=dunfell"
export "GYOCTO_BUILD=build-rpi"
export "GYOCTO_ROOT=${GPROJECT_APP}/yocto"
export "GYOCTO_POKY=${GYOCTO_ROOT}/poky"
export "GYOCTO_RPI=${GYOCTO_POKY}/meta-raspberrypi/conf/machine/"
export "GYOCTO_IMG_PATH=${GYOCTO_POKY}/${GYOCTO_BUILD}/tmp/deploy/images/raspberrypi4-64"
export "GYOCTO_IMG_RPI=${GYOCTO_IMG_PATH}/core-image-minimal-raspberrypi4.rpi-sdimg"
export "GYOCTO_IMG_WIC=${GYOCTO_IMG_PATH}/core-image-base-raspberrypi4-64.wic.bz2"
export "GYOCTO_IMG_BMAP=${GYOCTO_IMG_PATH}/core-image-base-raspberrypi4-64.wic.bmap"
#================================================
export "GBUILDROOT_IMG_SD=/dev/sda"
export "GBUILDROOT_ROOT=${GPROJECT_APP}/buildroot"
export "GBUILDROOT_URL=https://buildroot.org/downloads/buildroot-2021.02.1.tar.gz"
export "GBUILDROOT_ARCHIVE=buildroot-2021.02.1.tar.gz"
export "GBUILDROOT_NAME=buildroot-2021.02.1"
export "GBUILDROOT_SRC=${GBUILDROOT_ROOT}/${GBUILDROOT_NAME}"
export "GBUILDROOT_CONFIG=raspberrypi4_64_defconfig"
export "GBUILDROOT_IMG_PATH=${GBUILDROOT_SRC}/output/images"
export "GBUILDROOT_IMG_FILE=${GBUILDROOT_IMG_PATH}/sdcard.img"
#================================================
export "GGIT_URL=https://github.com/gkesse/ReadyRPI"
export "GGIT_NAME=ReadyRPI"
#================================================
