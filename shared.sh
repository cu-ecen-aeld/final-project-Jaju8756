#!/bin/sh
# Shared definitions for Buildroot scripts (BBB project)

# External tree
BR2_EXTERNAL_DIR=base_external
EXTERNAL_REL_BUILDROOT=../${BR2_EXTERNAL_DIR}

# Output directory
OUTPUT_DIR=../output

# Default BBB defconfig (from Buildroot)
BBB_DEFCONFIG=beaglebone_defconfig

# saved defconfig
PROJECT_DEFCONFIG=${BR2_EXTERNAL_DIR}/configs/bbb_defconfig
PROJECT_DEFCONFIG_REL_BUILDROOT=../${PROJECT_DEFCONFIG}
