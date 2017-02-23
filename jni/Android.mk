LOCAL_PATH := $(PWD)

SYMPHONY_VERSION := 1.1.2
SYMPHONY_LIB_TYPE := release-cpu
SYMPHONY_DIR := /opt/Qualcomm/Symphony/1.1.2/arm-linux-androideabi
include $(SYMPHONY_DIR)/lib/SYMPHONY.mk



include $(CLEAR_VARS)
# Force the generation of binaries compliant with the ARM instruction set instead of the Thumb (compact) instruction (sub)set.
LOCAL_ARM_MODE := arm
# Allow the use of ARM Advanced SIMD (NEON) GCC intrinsics in C/C++ sources, as well as NEON instructions in Assembly files.
ifeq ($(TARGET_ARCH_ABI), armeabi-v7a)
	LOCAL_ARM_NEON := true
endif
LOCAL_MODULE := darknet_arm
LOCAL_CPP_FEATURES := exceptions
LOCAL_CFLAGS += -Ofast
LOCAL_SHARED_LIBRARIES := libsymphony
LOCAL_SRC_FILES := $(wildcard src/*.c)
include $(BUILD_EXECUTABLE)