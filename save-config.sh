#!/bin/bash
# Save Buildroot + Kernel configuration

set -e

cd "$(dirname "$0")"
source shared.sh

echo "Saving Buildroot defconfig..."

mkdir -p ${EXTERNAL_REL_BUILDROOT}/configs/

make -C buildroot savedefconfig BR2_DEFCONFIG=${PROJECT_MODIFIED_DEFCONFIG_REL_BUILDROOT}

echo "Saved to ${PROJECT_MODIFIED_DEFCONFIG}"

# Save Linux kernel config if custom kernel config is enabled
if [ -e buildroot/.config ] && [ ls buildroot/output/build/linux-*/.config 1> /dev/null 2>&1 ]; then
	grep "BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE" buildroot/.config > /dev/null
	if [ $? -eq 0 ]; then
		echo "Saving linux defconfig"
		make -C buildroot linux-update-defconfig
	fi
fi

echo "Configuration saved successfully!"
