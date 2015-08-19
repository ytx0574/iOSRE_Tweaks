THEOS_DEVICE_IP = 192.168.1.123
ARCHS = armv7 arm64
TARGET = iphone:latest:7.0


include theos/makefiles/common.mk

TWEAK_NAME = huochairen
huochairen_FILES = Tweak.xm
huochairen_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 DiabloLOL"
