LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_PRIVATE_CFLAGS:=

SOURCE_PATH := ./src

LOCAL_C_INCLUDES := \
	frameworks/native/include/media/openmax \
	$(LOCAL_PATH)/include		\
	$(LOCAL_PATH)/include/android	\
	$(LOCAL_PATH)/src		\
	$(LOCAL_PATH)/src/base		\
	$(LOCAL_PATH)/src/core_extensions \
	$(LOCAL_PATH)/src/components	\
	$(LOCAL_PATH)/src/dynamic_loader

LOCAL_SRC_FILES := \
	$(SOURCE_PATH)/st_static_component_loader.c	\
	$(SOURCE_PATH)/omxcore.c			\
	$(SOURCE_PATH)/omx_create_loaders_linux.c	\
	$(SOURCE_PATH)/tsemaphore.c			\
	$(SOURCE_PATH)/queue.c				\
	$(SOURCE_PATH)/utils.c				\
	$(SOURCE_PATH)/common.c				\
	$(SOURCE_PATH)/content_pipe_inet.c		\
	$(SOURCE_PATH)/content_pipe_file.c		\
	$(SOURCE_PATH)/omx_reference_resource_manager.c

# base
LOCAL_SRC_FILES += \
	$(SOURCE_PATH)/base/omx_base_component.c \
	$(SOURCE_PATH)/base/omx_base_port.c \
	$(SOURCE_PATH)/base/omx_base_filter.c \
	$(SOURCE_PATH)/base/omx_base_sink.c \
	$(SOURCE_PATH)/base/omx_base_source.c \
	$(SOURCE_PATH)/base/omx_base_audio_port.c \
	$(SOURCE_PATH)/base/omx_base_video_port.c \
	$(SOURCE_PATH)/base/omx_base_image_port.c \
	$(SOURCE_PATH)/base/omx_base_clock_port.c \
	$(SOURCE_PATH)/base/OMXComponentRMExt.c

# core_extensions
LOCAL_SRC_FILES += \
	$(SOURCE_PATH)/core_extensions/OMXCoreRMExt.c

# components
LOCAL_SRC_FILES +=

# dynamic_loader
#LOCAL_SRC_FILES += \
#	$(SOURCE_PATH)/dynamic_loader/ste_dynamic_component_loader.c

LOCAL_EXPORT_C_INCLUDE_DIRS := \
	frameworks/native/include/media/openmax \
	$(LOCAL_PATH)/include/bellagio \
	$(LOCAL_PATH)/include

LOCAL_SHARED_LIBRARIES := libdl liblog libcutils

LOCAL_MODULE := libomxil-bellagio
LOCAL_CFLAGS:= -Werror=unused-but-set-variable -Werror=uninitialized -DLOG_TAG=\"libomxil-bellagio\" $(LOCAL_PRIVATE_CFLAGS)
LOCAL_MODULE_TAGS := optional
ifeq ($(BOARD_VNDK_VERSION),current)
LOCAL_VENDOR_MODULE := true
endif
include $(BUILD_SHARED_LIBRARY)


include $(CLEAR_VARS)

LOCAL_C_INCLUDES := \
	$(LOCAL_PATH)/include \
	$(LOCAL_PATH)/include/android

LOCAL_SRC_FILES := \
	$(SOURCE_PATH)/omxregister.c \
	$(SOURCE_PATH)/common.c

LOCAL_SHARED_LIBRARIES := libdl liblog libcutils

LOCAL_MODULE := omxregister_bellagio
LOCAL_CFLAGS := -Werror=unused-but-set-variable -Werror=uninitialized -DOMXILCOMPONENTSPATH=\"/system/lib\"
LOCAL_MODULE_TAGS := optional
ifeq ($(BOARD_VNDK_VERSION),current)
LOCAL_VENDOR_MODULE := true
endif
include $(BUILD_EXECUTABLE)

