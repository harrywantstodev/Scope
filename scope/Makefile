include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = Scope
Scope_FILES = scpRootListController.m
Scope_INSTALL_PATH = /Library/PreferenceBundles
Scope_FRAMEWORKS = UIKit
Scope_PRIVATE_FRAMEWORKS = Preferences
Scope_EXTRA_FRAMEWORKS += Cephei  CepheiPrefs

GO_EASY_ON_ME = 1

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/Scope.plist$(ECHO_END)
