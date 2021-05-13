#================================================
SHELL := /bin/bash
#================================================
# yocto
yocto_all: yocto_poky yocto_rpi yocto_oe yocto_env yocto_rpi_ls

yocto_poky:
	@if ! [ -d $(GYOCTO_ROOT) ] ; then mkdir -p $(GYOCTO_ROOT) ; fi
	@cd $(GYOCTO_ROOT) && git clone -b $(GYOCTO_BRANCH) git://git.yoctoproject.org/poky
yocto_rpi:
	@if ! [ -d $(GYOCTO_ROOT) ] ; then mkdir -p $(GYOCTO_ROOT) ; fi
	@cd $(GYOCTO_POKY) && git clone -b $(GYOCTO_BRANCH) git://git.yoctoproject.org/meta-raspberrypi
yocto_oe:
	@if ! [ -d $(GYOCTO_ROOT) ] ; then mkdir -p $(GYOCTO_ROOT) ; fi
	@cd $(GYOCTO_POKY) && git clone -b $(GYOCTO_BRANCH) git://git.openembedded.org/meta-openembedded
yocto_crypt:
	@if ! [ -d $(GYOCTO_ROOT) ] ; then mkdir -p $(GYOCTO_ROOT) ; fi
	@cd $(GYOCTO_POKY) && git clone https://github.com/cpb-/password-encryption
yocto_crypt_build:
	@if ! [ -d $(GYOCTO_ROOT) ] ; then mkdir -p $(GYOCTO_ROOT) ; fi
	@cd $(GYOCTO_POKY)/password-encryption && make all
yocto_crypt_pass:
	@if ! [ -d $(GYOCTO_ROOT) ] ; then mkdir -p $(GYOCTO_ROOT) ; fi
	@cd $(GYOCTO_POKY)/password-encryption && ./crypt linux
yocto_env:
	@if ! [ -d $(GYOCTO_ROOT) ] ; then mkdir -p $(GYOCTO_ROOT) ; fi
	@cd $(GYOCTO_POKY) && source oe-init-build-env $(GYOCTO_BUILD)
yocto_rpi_ls:
	@if ! [ -d $(GYOCTO_ROOT) ] ; then mkdir -p $(GYOCTO_ROOT) ; fi
	@cd $(GYOCTO_POKY) && ls -l $(GYOCTO_RPI)
yocto_bitbake:
	@if ! [ -d $(GYOCTO_ROOT) ] ; then mkdir -p $(GYOCTO_ROOT) ; fi
	@cd $(GYOCTO_POKY) && source oe-init-build-env $(GYOCTO_BUILD) && bitbake core-image-base
yocto_img:
	@if ! [ -d $(GYOCTO_ROOT) ] ; then mkdir -p $(GYOCTO_ROOT) ; fi
	@cd $(GYOCTO_IMG_PATH) && ls -l *rpi-sdimg
yocto_lsblk:
	@if ! [ -d $(GYOCTO_ROOT) ] ; then mkdir -p $(GYOCTO_ROOT) ; fi
	@lsblk -p
yocto_umount:
	@if ! [ -d $(GYOCTO_ROOT) ] ; then mkdir -p $(GYOCTO_ROOT) ; fi
	@umount $(GYOCTO_IMG_SD)?
yocto_dd:
	@if ! [ -d $(GYOCTO_ROOT) ] ; then mkdir -p $(GYOCTO_ROOT) ; fi
	@sudo dd if=$(GYOCTO_IMG_FILE) of=$(GYOCTO_IMG_SD)
yocto_rm:
	@if ! [ -d $(GPROJECT_APP) ] ; then mkdir -p $(GPROJECT_APP) ; fi
	@cd $(GPROJECT_APP) && rm -rf $(GYOCTO_ROOT)
#================================================
# buildroot
buildroot_all: buildroot_wget buildroot_tar buildroot_configs

buildroot_wget:
	@if ! [ -d $(GBUILDROOT_ROOT) ] ; then mkdir -p $(GBUILDROOT_ROOT) ; fi
	@cd $(GBUILDROOT_ROOT) && wget $(GBUILDROOT_URL) 
buildroot_tar:
	@if ! [ -d $(GBUILDROOT_ROOT) ] ; then mkdir -p $(GBUILDROOT_ROOT) ; fi
	@cd $(GBUILDROOT_ROOT) && tar xzfv $(GBUILDROOT_ARCHIVE)
buildroot_configs:
	@if ! [ -d $(GBUILDROOT_ROOT) ] ; then mkdir -p $(GBUILDROOT_ROOT) ; fi
	@cd $(GBUILDROOT_SRC) && ls -l configs
buildroot_defconfig:
	@if ! [ -d $(GBUILDROOT_ROOT) ] ; then mkdir -p $(GBUILDROOT_ROOT) ; fi
	@cd $(GBUILDROOT_SRC) && make $(GBUILDROOT_CONFIG)
buildroot_menuconfig:
	@if ! [ -d $(GBUILDROOT_ROOT) ] ; then mkdir -p $(GBUILDROOT_ROOT) ; fi
	@cd $(GBUILDROOT_SRC) && make menuconfig
buildroot_build:
	@if ! [ -d $(GBUILDROOT_ROOT) ] ; then mkdir -p $(GBUILDROOT_ROOT) ; fi
	@cd $(GBUILDROOT_SRC) && make
buildroot_lsblk:
	@if ! [ -d $(GBUILDROOT_ROOT) ] ; then mkdir -p $(GBUILDROOT_ROOT) ; fi
	@lsblk -p
buildroot_umount:
	@if ! [ -d $(GBUILDROOT_ROOT) ] ; then mkdir -p $(GBUILDROOT_ROOT) ; fi
	@umount $(GBUILDROOT_IMG_SD)?
buildroot_dd:
	@if ! [ -d $(GBUILDROOT_ROOT) ] ; then mkdir -p $(GBUILDROOT_ROOT) ; fi
	@sudo dd if=$(GBUILDROOT_IMG_FILE) of=$(GBUILDROOT_IMG_SD)
#================================================
# git
git_status:
	@cd $(GPROJECT_PATH) && git status -u
git_push:
	@cd $(GPROJECT_PATH) && git pull && git add --all && git commit -m "Initial Commit" && git push -u origin main
git_push_o:
	@cd $(GPROJECT_PATH) && git add --all && git commit -m "Initial Commit" && git push -u origin main
git_store:
	@git config credential.helper store
git_clone:
	@cd $(GPROJECT_ROOT) && git clone $(GGIT_URL) $(GGIT_NAME) 
#================================================
