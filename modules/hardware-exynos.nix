{ config, lib, pkgs, ... }:

let
  inherit (lib) mkMerge mkOption mkIf types;
  cfg = config.mobile.hardware.socs;
in
{
  options.mobile = {
    hardware.socs.exynos-7880.enable = mkOption {
      type = types.bool;
      default = false;
      description = "enable when SOC is Exynos 7880";
    };
    hardware.socs.exynos-8890.enable = mkOption {
      type = types.bool;
      default = false;
      description = "enable when SOC is Exynos 8890";
    };
  };

  config = mkMerge [
    {
      mobile = mkIf cfg.exynos-7880.enable {
        system.system = "aarch64-linux";
        quirks.fb-refresher.enable = true;
      };
      mobile = mkIf cfg.exynos-8890.enable {
        system.system = "aarch64-linux";
        quirks.fb-refresher.enable = true;
      };
    }
  ];
}
