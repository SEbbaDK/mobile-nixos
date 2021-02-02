{ config, lib, pkgs, ... }:

{
  mobile.device.name = "samsung-santos10wifi";
  mobile.device.identity = {
    name = "Galaxy Tab 3 10.1 WiFi (2013)";
    manufacturer = "Samsung";
  };

  mobile.hardware = {
    soc = "atom-z2560";
    ram = 1024 * 1;
    screen = {
      width = 1280;
      height = 800;
    };
  };

  mobile.boot.stage-1 = {
    kernel.package = pkgs.callPackage ./kernel { };
  };

  mobile.system.type = "android";
}
