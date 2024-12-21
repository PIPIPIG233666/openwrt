define Device/8devices_mango-dvk
	$(call Device/FitImageLzma)
	DEVICE_VENDOR := 8devices
	DEVICE_MODEL := Mango-DVK
	IMAGE_SIZE := 27776k
	BLOCKSIZE := 64k
	SOC := ipq6010
	SUPPORTED_DEVICES += 8devices,mango
	IMAGE/sysupgrade.bin := append-kernel | pad-to 64k | append-rootfs | pad-rootfs | check-size | append-metadata
	DEVICE_PACKAGES := ipq-wifi-8devices_mango
endef
TARGET_DEVICES += 8devices_mango-dvk

define Device/cambiumnetworks_xe3-4
	$(call Device/FitImage)
	$(call Device/UbiFit)
	DEVICE_VENDOR := Cambium Networks
	DEVICE_MODEL := XE3-4
	BLOCKSIZE := 128k
	PAGESIZE := 2048
	DEVICE_DTS_CONFIG := config@cp01-c3-xv3-4
	SOC := ipq6010
	DEVICE_PACKAGES := ipq-wifi-cambiumnetworks_xe34 ath11k-firmware-qcn9074 kmod-ath11k-pci
endef
TARGET_DEVICES += cambiumnetworks_xe3-4

define Device/linksys_mr
	$(call Device/FitImage)
	DEVICE_VENDOR := Linksys
	BLOCKSIZE := 128k
	PAGESIZE := 2048
	KERNEL_SIZE := 8192k
	IMAGES += factory.bin
	IMAGE/factory.bin := append-kernel | pad-to $$$$(KERNEL_SIZE) | append-ubi | linksys-image type=$$$$(DEVICE_MODEL)
endef

define Device/linksys_mr7350
	$(call Device/linksys_mr)
	DEVICE_MODEL := MR7350
	NAND_SIZE := 256m
	IMAGE_SIZE := 75776k
	SOC := ipq6000
	DEVICE_PACKAGES := ipq-wifi-linksys_mr7350 \
		kmod-leds-pca963x kmod-usb-ledtrig-usbport
endef
TARGET_DEVICES += linksys_mr7350

define Device/linksys_mr7500
	$(call Device/linksys_mr)
	DEVICE_MODEL := MR7500
	SOC := ipq6018
	NAND_SIZE := 512m
	IMAGE_SIZE := 147456k
	DEVICE_PACKAGES := ipq-wifi-linksys_mr7500 \
		ath11k-firmware-qcn9074 kmod-ath11k-pci
endef
TARGET_DEVICES += linksys_mr7500

define Device/netgear_wax214
	$(call Device/FitImage)
	$(call Device/UbiFit)
	DEVICE_VENDOR := Netgear
	DEVICE_MODEL := WAX214
	BLOCKSIZE := 128k
	PAGESIZE := 2048
	DEVICE_DTS_CONFIG := config@cp03-c1
	SOC := ipq6010
	DEVICE_PACKAGES := ipq-wifi-netgear_wax214
endef
TARGET_DEVICES += netgear_wax214

define Device/qihoo_360v6
	$(call Device/FitImage)
	$(call Device/UbiFit)
	DEVICE_VENDOR := Qihoo
	DEVICE_MODEL := 360V6
	BLOCKSIZE := 128k
	PAGESIZE := 2048
	SOC := ipq6000
	DEVICE_DTS_CONFIG := config@cp03-c1
	DEVICE_PACKAGES := ipq-wifi-qihoo_360v6
endef
TARGET_DEVICES += qihoo_360v6

define Device/tplink_eap610-outdoor
	$(call Device/FitImage)
	$(call Device/UbiFit)
	DEVICE_VENDOR := TP-Link
	DEVICE_MODEL := EAP610-Outdoor
	BLOCKSIZE := 128k
	PAGESIZE := 2048
	SOC := ipq6018
	DEVICE_PACKAGES := ipq-wifi-tplink_eap610-outdoor
	IMAGES += web-ui-factory.bin
	IMAGE/web-ui-factory.bin := append-ubi | tplink-image-2022
	TPLINK_SUPPORT_STRING := SupportList: \
		EAP610-Outdoor(TP-Link|UN|AX1800-D):1.0 \
		EAP610-Outdoor(TP-Link|JP|AX1800-D):1.0 \
		EAP610-Outdoor(TP-Link|CA|AX1800-D):1.0
endef
TARGET_DEVICES += tplink_eap610-outdoor

define Device/yuncore_fap650
	$(call Device/FitImage)
	$(call Device/UbiFit)
	DEVICE_VENDOR := Yuncore
	DEVICE_MODEL := FAP650
	BLOCKSIZE := 128k
	PAGESIZE := 2048
	DEVICE_DTS_CONFIG := config@cp03-c1
	SOC := ipq6018
	DEVICE_PACKAGES := ipq-wifi-yuncore_fap650
	IMAGES := factory.ubi factory.ubin sysupgrade.bin
	IMAGE/factory.ubin := append-ubi | qsdk-ipq-factory-nand
endef
TARGET_DEVICES += yuncore_fap650
