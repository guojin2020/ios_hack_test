include theos/makefiles/common.mk

TWEAK_NAME = firstTweak
firstTweak_FILES = Tweak.xm

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 com.apple.mobilephone"
