{ config, lib, pkgs, ... }:

let
  inherit (lib) mkMerge mkOption mkIf types;
  cfg = config.mobile.hardware.socs;
in
{
  options.mobile = {
    hardware.socs.atom-z2560.enable = mkOption {
      type = types.bool;
      default = false;
      description = "enable when SOC is Atom z2560";
    };
  };

  config = mkMerge [
    {
      mobile = mkIf cfg.atom-z2560.enable {
        system.system = "i686-linux";
      };
    }
  ];
}
