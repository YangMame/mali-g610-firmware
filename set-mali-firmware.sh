#!/bin/bash

set -e

mali_ddk_version=$(dmesg |grep "mali fb000000.gpu: Kernel DDK version"|awk '{print $NF}')
case "$mali_ddk_version" in
	g18p0-01eac0)
		rm -f /lib/firmware/mali_csffw.bin
		ln -s /lib/firmware/mali_csffw_g18p0/mali_csffw.bin /lib/firmware/mali_csffw.bin
		;;
	g17p0-01eac0)
		rm -f /lib/firmware/mali_csffw.bin
		ln -s /lib/firmware/mali_csffw_g17p0/mali_csffw.bin /lib/firmware/mali_csffw.bin
		;;
	*)
		rm -f /lib/firmware/mali_csffw.bin
		ln -s /lib/firmware/mali_csffw_g15p0/mali_csffw.bin /lib/firmware/mali_csffw.bin
		;;
esac
