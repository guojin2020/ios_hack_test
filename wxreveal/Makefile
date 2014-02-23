THEOS_DEVICE_IP = 192.168.199.157
ARCHS = armv7
TARGET = iphone:7.0:4.3

include theos/makefiles/common.mk

TWEAK_NAME = WXReveal
WXReveal_FILES = Tweak.xm RevealUtil.m
WXReveal_FRAMEWORKS = UIKit CFNetwork
WXReveal_PRIVATE_FRAMEWORKS = AppSupport

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
