THEOS_DEVICE_IP = 192.168.100.104
ARCHS = armv7 arm64
TARGET = iphone:latest:7.0



include theos/makefiles/common.mk

TWEAK_NAME = ImgoTV
ImgoTV_FILES = Tweak.xm
ImgoTV_FRAMEWORKS = UIKit Foundation

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 ImgoTV-ipad"
