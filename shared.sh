#!/bin/sh
# Shared definitions for Buildroot scripts (RPi project)

# External
EXTERNAL_REL_BUILDROOT=../base_external

# Default RPi defconfig (from Buildroot)
RPI_DEFAULT_DEFCONFIG=configs/raspberrypi4_64_defconfig

# saved defconfig
RPI_MODIFIED_DEFCONFIG=base_external/configs/rpi_defconfig

PROJECT_DEFAULT_DEFCONFIG=${RPI_DEFAULT_DEFCONFIG}
PROJECT_MODIFIED_DEFCONFIG=${RPI_MODIFIED_DEFCONFIG}
PROJECT_MODIFIED_DEFCONFIG_REL_BUILDROOT=../${PROJECT_MODIFIED_DEFCONFIG}
