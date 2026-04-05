#!/bin/bash
# Build script for RPi Buildroot project
# make O=../output BR2_EXTERNAL=../base_external menuconfig

set -e

cd "$(dirname "$0")"
source shared.sh

echo "Initializing submodules..."
git submodule init
git submodule sync
git submodule update

echo "Starting Buildroot build..."

# If no config exists → initialize
if [ ! -f buildroot/.config ]; then
    echo "No existing config found."

    if [ -f ${PROJECT_MODIFIED_DEFCONFIG} ]; then
        echo "Using saved project defconfig: ${PROJECT_MODIFIED_DEFCONFIG}"
	make -C buildroot defconfig BR2_EXTERNAL=${EXTERNAL_REL_BUILDROOT} BR2_DEFCONFIG=${PROJECT_DEFCONFIG_REL_BUILDROOT}
    else
        echo "Using default RPi defconfig"
	make -C buildroot defconfig BR2_EXTERNAL=${EXTERNAL_REL_BUILDROOT} BR2_DEFCONFIG=${RPI_DEFAULT_DEFCONFIG}
    fi
else
    echo "Using existing configuration (output/.config)"
fi

# Build system
make -C buildroot BR2_EXTERNAL=${EXTERNAL_REL_BUILDROOT}

echo "Build complete!"
