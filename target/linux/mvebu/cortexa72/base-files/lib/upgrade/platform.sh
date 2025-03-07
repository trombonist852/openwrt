#
# Copyright (C) 2014-2016 OpenWrt.org
# Copyright (C) 2016 LEDE-Project.org
#

RAMFS_COPY_BIN='fw_printenv fw_setenv'
RAMFS_COPY_DATA='/etc/fw_env.config /var/lock/fw_printenv.lock'
REQUIRE_IMAGE_METADATA=1

platform_check_image() {
	case "$(board_name)" in
	marvell,armada8040-mcbin-doubleshot|\
	marvell,armada8040-mcbin-singleshot)
		sdcard_check_image "$1"
		;;
	*)
		return 0
		;;
	esac
}

platform_do_upgrade() {
	case "$(board_name)" in
	marvell,armada8040-mcbin-doubleshot|\
	marvell,armada8040-mcbin-singleshot)
		sdcard_do_upgrade "$1"
		;;
	*)
		default_do_upgrade "$1"
		;;
	esac
}
platform_copy_config() {
	case "$(board_name)" in
	marvell,armada8040-mcbin-doubleshot|\
	marvell,armada8040-mcbin-singleshot)
		sdcard_copy_config
		;;
	esac
}
