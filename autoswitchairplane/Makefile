THEOS_DEVICE_IP = 192.168.2.3
ARCHS = armv7 arm64
TARGET = iphone:latest:8.0


include theos/makefiles/common.mk

TWEAK_NAME = autoswitchairplane
autoswitchairplane_FILES = Tweak.xm
autoswitchairplane_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
