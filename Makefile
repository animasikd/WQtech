TARGET := iphone:clang:latest:15.0
ARCHS := iphoneos-arm64
THEOS_PACKAGE_SCHEME := rootless

include $(THEOS)/makefiles/common.mk

TWEAK_NAME := NeonBadge

NeonBadge_FILES := Tweak.x
NeonBadge_CFLAGS := -fobjc-arc

include $(THEOS)/makefiles/tweak.mk
