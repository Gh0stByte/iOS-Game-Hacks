include theos/makefiles/common.mk

BUNDLE_NAME = SuperCats
SuperCats_FILES = SuperCats.mm
SuperCats_INSTALL_PATH = /Library/PreferenceBundles
SuperCats_FRAMEWORKS = UIKit
SuperCats_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/SuperCats.plist$(ECHO_END)
