export OF_DISABLE_OTA_MENU=1
export FOX_AB_DEVICE=1
export FOX_VIRTUAL_AB_DEVICE=1
export OF_DEFAULT_KEYMASTER_VERSION=4.1
export OF_NO_TREBLE_COMPATIBILITY_CHECK=1
export OF_MAINTAINER="HAPPYGAMES222"
export FOX_VARIANT="Stable"
export OF_FLASHLIGHT_ENABLE=0

export FOX_USE_BASH_SHELL=1
export FOX_USE_NANO_EDITOR=1
export FOX_USE_TAR_BINARY=1
export FOX_USE_SED_BINARY=1
export FOX_USE_XZ_UTILS=1
export FOX_ASH_IS_BASH=1
export OF_ENABLE_LPTOOLS=1
export FOX_DELETE_AROMAFM=1
export FOX_ENABLE_APP_MANAGER=1
export OF_SUPPORT_VBMETA_AVB2_PATCHING=1

export OF_LOOP_DEVICE_ERRORS_TO_LOG=1

export OF_USE_LZ4_COMPRESSION=true

export OF_USE_MAGISKBOOT="1"
export OF_USE_MAGISKBOOT_FOR_ALL_PATCHES="1"

export OF_SCREEN_H=2460
export OF_STATUS_H=95
export OF_STATUS_INDENT_LEFT=48
export OF_STATUS_INDENT_RIGHT=48
export OF_ALLOW_DISABLE_NAVBAR=0
export OF_CLOCK_POS=1

# Important build settings
export ALLOW_MISSING_DEPENDENCIES=true
export LC_ALL="C"

# use magisk 27.0 for the magisk addon
export FOX_USE_SPECIFIC_MAGISK_ZIP=~/Magisk/Magisk-v27.0.zip
export MAGISK_VER=27.0

# instruct magiskboot v26+ to always patch the vbmeta header when patching the recovery/boot image; do *not* remove!
export FOX_PATCH_VBMETA_FLAG=1

# Clone to fix build on minimal manifest
git clone https://android.googlesource.com/platform/external/gflags/ -b android-12.1.0_r4 external/gflags

# Patches
RET=0
cd bootable/recovery
git apply ../../device/transsion/mt6789-common/patches/0001-Change-haptics-activation-file-path.patch > /dev/null 2>&1 || RET=$?
cd ../../
if [ $RET -ne 0 ];then
    echo "ERROR: Patch is not applied! Maybe it's already patched?"
else
    echo "OK: All patched"
fi
