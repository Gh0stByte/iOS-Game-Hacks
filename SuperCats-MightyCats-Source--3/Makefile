include theos/makefiles/common.mk

TWEAK_NAME = SuperCats
SuperCats_FILES = Hack.xm UI.xm
SuperCats_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 MightyCats; killall -9 Preferences"
SUBPROJECTS += "SuperCats"
include $(THEOS_MAKE_PATH)/aggregate.mk
