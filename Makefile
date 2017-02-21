include $(THEOS)/makefiles/common.mk

GO_EASY_ON_ME = 1

TWEAK_NAME = Scope
Scope_FILES = Tweak.xm
Scope_EXTRA_FRAMEWORKS += Cephei  CepheiPrefs

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += scope
include $(THEOS_MAKE_PATH)/aggregate.mk
