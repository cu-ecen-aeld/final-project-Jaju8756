#!/bin/bash
# Build script for BBB Buildroot project

set -e

cd "$(dirname "$0")"
source shared.sh

echo "Initializing submodules..."
git submodule init
git submodule sync
git submodule update

echo "Starting Buildroot build..."

# If no config exists → initialize
if [ ! -f output/.config ]; then
    echo "No existing config found."

    if [ -f ${PROJECT_DEFCONFIG} ]; then
        echo "Using saved project defconfig: ${PROJECT_DEFCONFIG}"
        make -C buildroot O=${OUTPUT_DIR} \
            BR2_EXTERNAL=${EXTERNAL_REL_BUILDROOT} \
            BR2_DEFCONFIG=${PROJECT_DEFCONFIG_REL_BUILDROOT} \
            defconfig
    else
        echo "Using default BBB defconfig"
        make -C buildroot O=${OUTPUT_DIR} \
            BR2_EXTERNAL=${EXTERNAL_REL_BUILDROOT} \
            ${BBB_DEFCONFIG}
    fi
else
    echo "Using existing configuration (output/.config)"
fi

# Build system
make -C buildroot O=${OUTPUT_DIR} \
    BR2_EXTERNAL=${EXTERNAL_REL_BUILDROOT}

echo "Build complete!"
