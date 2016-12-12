#!/bin/bash -ex

mount -o remount,ro /sys/fs/selinux
exec $0
