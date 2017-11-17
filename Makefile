export ISO_URL?=file://${HOME}/Downloads/rhel-server-7.4-x86_64-dvd.iso

rhel-7.4-kvm.box: rhel-7.4-kvm.json scripts/update.sh scripts/cleanup.sh scripts/register.sh scripts/register.sh.example scripts/sshd.sh scripts/unregister.sh scripts/update.sh scripts/vagrant.sh
	packer.io build rhel-7.4-kvm.json

scripts/register.sh:
	@echo creating scripts/register.sh
	@printf '#!/usr/bin/env bash\nsubscription-manager register --username %s --password %s --auto-attach' "${SUB_USERNAME}" "${SUB_PASSWORD}" >scripts/register.sh

install: rhel-7.4-kvm.box
	vagrant box add -f rhel-7.4-kvm.box --name rhel74
