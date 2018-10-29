NITROGEN_VERSION=2.3.1

PROJECT?=memtools

all: nitrogen ctools launcher

nitrogen:
	git clone https://github.com/nitrogen/nitrogen.git
	#git -C nitrogen checkout v$(NITROGEN_VERSION)
	patch -d nitrogen -p1 -strip=1 < nitrogen_deps.patch
	@($(MAKE) slim PLATFORM=cowboy PROJECT=$(PROJECT) PREFIX=.. -C nitrogen)
	git -C nitrogen reset --hard HEAD

ctools:
	chmod +x ctools.sh
	rm -r "$(PROJECT)/site"
	cp -r ./site "$(PROJECT)"
	cp -r ./data "$(PROJECT)"
	patch "$(PROJECT)/etc/vm.args" ./mnesia.patch 
	$(MAKE) -j -C "$(PROJECT)"

launcher:
	sed -e "s|PREFIX|$(realpath $(PROJECT))|g" ctools.sh.in > ctools.sh

clean:
	rm -rf nitrogen
	rm -rf memtools
