#================================================
export "GPROJECT_ROOT=/home/rpi4/Programs"
export "GPROJECT_PATH=${GPROJECT_ROOT}/ReadyRPI"
export "GPROJECT_APP=${GPROJECT_PATH}/app"
#================================================
export "GYOCTO_ROOT=${GPROJECT_APP}/yocto"
export "GYOCTO_POKY=${GYOCTO_ROOT}/poky"
export "GYOCTO_RPI=${GYOCTO_POKY}/meta-raspberrypi/conf/machine/"
export "GYOCTO_IMG_PATH=/home/rpi4/Programs/ReadyOpt/yocto/poky/rpi-build/tmp/deploy/images/raspberrypi4"
export "GYOCTO_IMG_FILE=${GYOCTO_IMG_PATH}"
export "GYOCTO_BRANCH=dunfell"
export "GYOCTO_BUILD=build-rpi"
#================================================
export "GGIT_URL=https://github.com/gkesse/ReadyRPI"
export "GGIT_NAME=ReadyRPI"
#================================================
