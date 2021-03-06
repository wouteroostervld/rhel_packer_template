## Build of Red Hat Enterprise 7.4 x86\_64 for Vagrant with libvirt/kvm-provider

rhel-packer-build is a buildscript for vagrantboxes for libvirt/kvm. Technology used packer, vagrant, gmake and sh.

## Overview

This repository contains templates for [RHEL7](https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/7/index.html)
x86\_64 that creates [Vagrant](http://vagrantup.com) boxes using [Packer](http://packer.io).

## Prerequisites

To build all the boxes, you will need Packer, Vagrant and libvirt with kvm
installed. You will also need the RHEL7.4 64-bit DVD ISO from Red Hat.

Because the name packer clashes with cracklib please rename the actual packer to `packer.io`.

## Configure

You need copy scripts/register.sh.example to scripts/register.sh and add your RedHat Login (where you should have some spare entitlements).

## Creating the box

* Set `ISO_URL` to the location of the installation ISO or put it in your ~/Downloads folder.
* Do 'make' to build the box
* Add the box to Vagrant using 'make install'.

### Example

    ISO_URL=file:///usr/local/isos/rhel-server-7.4-x86_64-dvd.iso make install

### Using it in Vagrant

* Install the vagrant-register plugin.
* Copy the Vagrantfile\_example as Vagrantfile in your project.
* Do 'vagrant up'.

### Credits

Adapted from https://github.com/jmassara/packer-rhel7-vms
