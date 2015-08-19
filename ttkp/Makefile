THEOS_DEVICE_IP = 192.168.2.234
ARCHS = armv7 arm64
TARGET = iphone:latest:8.0

include theos/makefiles/common.mk

TWEAK_NAME = ttkp
ttkp_FILES = Tweak.xm
ttkp_FRAMEWORKS = UIKit StoreKit Foundation

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 BreezeGame"
