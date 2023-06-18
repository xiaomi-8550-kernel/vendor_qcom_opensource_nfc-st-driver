KERNEL_SRC ?= /lib/modules/$(shell uname -r)/build

KBUILD_OPTIONS += NFC_ROOT=$(KERNEL_SRC)/$(M)
KBUILD_OPTIONS += KBUILD_EXTRA_SYMBOLS=$(ANDROID_BUILD_TOP)/out/vendor/qcom/opensource/securemsm-kernel/Module.symvers

M ?= $(shell pwd)

all:
	$(MAKE) -C $(KERNEL_SRC) M=$(M) modules $(KBUILD_OPTIONS)

modules_install:
	$(MAKE) INSTALL_MOD_STRIP=1 -C $(KERNEL_SRC) M=$(M) modules_install

clean:
	$(MAKE) -C $(KERNEL_SRC) M=$(M) clean
