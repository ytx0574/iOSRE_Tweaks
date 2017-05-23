THEOS_DEVICE_IP = 192.168.100.123
ARCHS = armv7 arm64
TARGET = iphone:latest:8.0





include theos/makefiles/common.mk

TWEAK_NAME = lagou
lagou_FILES = Tweak.xm
lagou_FRAMEWORKS = UIKit Foundation

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 lagou_appstore"
