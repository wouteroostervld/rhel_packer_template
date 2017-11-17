#!/usr/bin/env bash
cd /tmp
curl -LO https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
rpm -i /tmp/epel-release-latest-7.noarch.rpm
rm /tmp/epel-release-latest-7.noarch.rpm
