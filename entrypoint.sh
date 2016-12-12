#!/bin/bash -ex

sudo mount -o remount,ro /sys/fs/selinux
exec $0
