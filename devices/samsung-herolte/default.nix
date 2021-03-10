{ pkgs, lib, ... }:

{
  mobile.device.name = "samsung-herolte";
  mobile.device.identity = {
    name = "Galaxy S7";
    manufacturer = "Samsung";
  };

  mobile.hardware = {
    soc = "exynos-8890";
    ram = 1024 * 4;
    screen = {
      width = 1080; height = 1920;
    };
  };

  mobile.boot.stage-1 = {
    kernel.package = pkgs.callPackage ./kernel { };
  };

  mobile.device.firmware = pkgs.callPackage ./firmware {};

  mobile.system.type = "android";
  mobile.system.android = {
    bootimg.flash = {
      offset_base = "0x10000000";
      offset_kernel = "0x00008000";
      offset_ramdisk = "0x01000000";
      offset_second = "0x00f00000";
      offset_tags = "0x00000100";
      pagesize = "2048";
    };
    flashingMethod = "odin";
  };

  boot.kernelParams = [
    # Extracted from an Android boot image
    # (Actually blank!)
  ];

  mobile.usb.mode = "android_usb";
  mobile.usb.idVendor = "04E8"; # Samsung
  mobile.usb.idProduct = "6860"; # Galaxy A
}
