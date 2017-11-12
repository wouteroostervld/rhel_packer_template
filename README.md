## Packer build for Red Hat Enterprise 7.4 x86\_64

rhel-packer-build is a buildscript for vagrantboxes for different providers (lkibvirt, ec2, azure). Technology used packer, vagrant, gmake and sh.

## Overview

This repository contains templates for [RHEL7](https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/7/index.html)
x86\_64 that creates [Vagrant](http://vagrantup.com) boxes using [Packer](http://packer.io).

## Prerequisites

To build all the boxes, you will need Packer and both VirtualBox and libvirt with kvm
installed. You will also need the RHEL7 64-bit ISO from Red Hat and, if
using VirtualBox, the guest additions ISO matching the version of VirtualBox you
are using (see [here](http://download.virtualbox.org/virtualbox)).
comes packaged with their tools.

Once you've obtained the ISOs, copy all of them into the same directory
(e.g. /usr/local/isos).

## Creating the boxes

* Export `ISO_URL` to the location of the installation ISO
* Run packer with `rhel-7.4-kvm.json` template
* Add the box to Vagrant
* Build VMs

### Example

```
$ export ISO_URL=file:///usr/local/isos/rhel-server-7.0-x86_64-dvd.iso
$ packer build rhel-7.0-kvm.json
$ vagrant box add rhel-7.0-kvm ./rhel-7.0-kvm.box
```

### Credits

Adapted from https://github.com/jmassara/packer-rhel7-vms
