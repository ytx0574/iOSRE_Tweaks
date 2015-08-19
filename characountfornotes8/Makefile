THEOS_DEVICE_IP = 192.168.1.234
ARCHS = arm64
TARGET = iphone:latest:8.0

include theos/makefiles/common.mk

TWEAK_NAME = CharacountForNotes8
CharacountForNotes8_FILES = Tweak.xm

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 MobileNotes"
