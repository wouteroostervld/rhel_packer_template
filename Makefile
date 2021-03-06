export ISO_URL?=file://${HOME}/Downloads/rhel-server-7.6-x86_64-dvd.iso

.PHONY: remove install reinstall clean

rhel-7.6-kvm.box: rhel-7.6-kvm.json scripts/update.sh scripts/cleanup.sh scripts/register.sh scripts/register.sh.example scripts/sshd.sh scripts/unregister.sh scripts/update.sh scripts/vagrant.sh
	packer.io build rhel-7.6-kvm.json

scripts/register.sh:
	@echo creating scripts/register.sh
	@printf '#!/usr/bin/env bash\nsubscription-manager register --username %s --password %s --auto-attach' "${SUB_USERNAME}" "${SUB_PASSWORD}" >scripts/register.sh

remove:
	vagrant box remove -f rhel75 || true
	sudo virsh vol-delete --pool default rhel75_vagrant_box_image_0.img || true
	sudo virsh pool-refresh default

install: rhel-7.6-kvm.box
	vagrant box add rhel-7.6-kvm.box --name rhel76

reinstall: remove install

clean:
	rm *.box
