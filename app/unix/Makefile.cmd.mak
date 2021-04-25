#================================================
SHELL := /bin/bash
#================================================
# yocto
yocto_all: yocto_poky yocto_rpi yocto_env yocto_rpi_ls

yocto_poky:
	@if ! [ -d $(GYOCTO_ROOT) ] ; then mkdir -p $(GYOCTO_ROOT) ; fi
	@cd $(GYOCTO_ROOT) && git clone -b $(GYOCTO_BRANCH) git://git.yoctoproject.org/poky
yocto_rpi:
	@if ! [ -d $(GYOCTO_ROOT) ] ; then mkdir -p $(GYOCTO_ROOT) ; fi
	@cd $(GYOCTO_POKY) && git clone -b $(GYOCTO_BRANCH) git://git.yoctoproject.org/meta-raspberrypi
yocto_env:
	@if ! [ -d $(GYOCTO_ROOT) ] ; then mkdir -p $(GYOCTO_ROOT) ; fi
	cd $(GYOCTO_POKY) && source oe-init-build-env $(GYOCTO_BUILD)
yocto_rpi_ls:
	@if ! [ -d $(GYOCTO_ROOT) ] ; then mkdir -p $(GYOCTO_ROOT) ; fi
	@cd $(GYOCTO_POKY) && ls -l $(GYOCTO_RPI)
yocto_bitbake:
	@if ! [ -d $(GYOCTO_ROOT) ] ; then mkdir -p $(GYOCTO_ROOT) ; fi
	@cd $(GYOCTO_POKY)/$(GYOCTO_BUILD) && bitbake core-image-base
yocto_sd:
	@if ! [ -d $(GYOCTO_ROOT) ] ; then mkdir -p $(GYOCTO_ROOT) ; fi
	@cd $(GYOCTO_POKY)/$(GYOCTO_BUILD) && bitbake core-image-base
yocto_rm:
	@if ! [ -d $(GPROJECT_APP) ] ; then mkdir -p $(GPROJECT_APP) ; fi
	@cd $(GPROJECT_APP) && rm -rf $(GYOCTO_ROOT)
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
