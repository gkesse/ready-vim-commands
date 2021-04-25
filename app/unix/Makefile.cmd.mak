#================================================
# yocto
yocto_poky:
	@if ! [ -d $(GYOCTO_ROOT) ] ; then mkdir -p $(GYOCTO_ROOT) ; fi
	@cd $(GYOCTO_ROOT) && git clone -b thud git://git.yoctoproject.org/poky
yocto_rpi:
	@if ! [ -d $(GYOCTO_ROOT) ] ; then mkdir -p $(GYOCTO_ROOT) ; fi
	@cd $(GYOCTO_POKY) && git clone -b thud git://git.yoctoproject.org/meta-raspberrypi
yocto_env:
	@if ! [ -d $(GYOCTO_ROOT) ] ; then mkdir -p $(GYOCTO_ROOT) ; fi
	@cd $(GYOCTO_POKY) && . oe-init-build-env ../build
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
