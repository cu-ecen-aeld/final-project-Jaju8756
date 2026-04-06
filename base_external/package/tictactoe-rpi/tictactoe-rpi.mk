#for a generic-package, the variable prefix must match the package name
TICTACTOE_RPI_VERSION = 859f2ea0a627b6f3cbc6452a6828d38695ad2ca1
TICTACTOE_RPI_SITE = https://github.com/Jaju8756/TicTacToe_s26_AESD.git
TICTACTOE_RPI_SITE_METHOD = git
TICTACTOE_RPI_GIT_SUBMODULES = YES

TICTACTOE_RPI_LICENSE = GPL-2.0
#TICTACTOE_RPI_LICENSE_FILES = LICENSE

define TICTACTOE_RPI_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) CXX="$(TARGET_CXX)" -C $(@D)/tictactoe-rpi/tests
endef

define TICTACTOE_RPI_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/tictactoe-rpi/tests/oled_test $(TARGET_DIR)/usr/bin/oled_test
	$(INSTALL) -D -m 0755 $(@D)/tictactoe-rpi/tests/mcp3002_test $(TARGET_DIR)/usr/bin/mcp3002_test
	$(INSTALL) -D -m 0755 $(@D)/tictactoe-rpi/tests/button_test $(TARGET_DIR)/usr/bin/button_test
endef

$(eval $(generic-package))
