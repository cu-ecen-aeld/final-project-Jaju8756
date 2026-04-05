#!/bin/sh
# Shared definitions for Buildroot scripts (RPi project)

# External tree
BR2_EXTERNAL_DIR=base_external
EXTERNAL_REL_BUILDROOT=../${BR2_EXTERNAL_DIR}

# Default RPi defconfig (from Buildroot)
RPI_DEFAULT_DEFCONFIG=configs/raspberrypi4_64_defconfig

# saved defconfig
PROJECT_MODIFIED_DEFCONFIG=${BR2_EXTERNAL_DIR}/configs/rpi_defconfig
PROJECT_DEFCONFIG_REL_BUILDROOT=../${PROJECT_MODIFIED_DEFCONFIG}
