#!/bin/bash
# Save Buildroot + Kernel configuration

set -e

cd "$(dirname "$0")"
source shared.sh

echo "Saving Buildroot defconfig..."

mkdir -p ${BR2_EXTERNAL_DIR}/configs

make -C buildroot savedefconfig O=${OUTPUT_DIR} BR2_DEFCONFIG=${PROJECT_DEFCONFIG_REL_BUILDROOT}

echo "Saved to ${PROJECT_DEFCONFIG}"

# Save Linux kernel config if custom kernel config is enabled
if ls ${OUTPUT_DIR}/build/linux-*/.config >/dev/null 2>&1; then
    if grep -q "BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE" ${OUTPUT_DIR}/.config; then
        echo "Saving Linux kernel defconfig..."
        make -C buildroot O=${OUTPUT_DIR} \
            BR2_EXTERNAL=${EXTERNAL_REL_BUILDROOT} \
            linux-update-defconfig
    fi
fi

echo "Configuration saved successfully!"
