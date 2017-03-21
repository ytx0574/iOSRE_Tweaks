THEOS_DEVICE_IP = 192.168.100.104
ARCHS = armv7 arm64
TARGET = iphone:latest:8.0



include theos/makefiles/common.mk

TWEAK_NAME = LetvIpadClient
LetvIpadClient_FILES = Tweak.xm
LetvIpadClient_FRAMEWORKS = UIKit Foundation AVFoundation

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 LetvIpadClient"
