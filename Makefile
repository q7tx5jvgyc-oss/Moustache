TWEAK_NAME = Moustache

Moustache_FILES = Tweak.xm
Moustache_FRAMEWORKS = UIKit Foundation

Moustache_CFLAGS = -fobjc-arc

ARCHS = arm64 arm64e
TARGET = iphone:clang:latest:14.0

INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk
include $(THEOS_MAKE_PATH)/tweak.mk
