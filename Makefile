# اسم التويك
TWEAK_NAME = Moustache

# الملفات المصدر
Moustache_FILES = main.mm

# frameworks المطلوبة
Moustache_FRAMEWORKS = UIKit Foundation

# دعم ARC
Moustache_CFLAGS = -fobjc-arc

# إعدادات معماريات iOS
ARCHS = arm64 arm64e

# iOS SDK
TARGET = iphone:clang:latest:14.0

# نوع التويك (dylib يتم حقنه)
INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk
include $(THEOS_MAKE_PATH)/tweak.mk
