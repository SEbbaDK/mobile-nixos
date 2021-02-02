{
  mobile-nixos
, fetchFromGitHub
}:

mobile-nixos.kernel-builder-gcc49 {
  configfile = ./config;

  version = "3.4.34";

  src = fetchFromGitHub {
    owner = "santos10-dev";
    repo = "android_kernel_samsung_santos10";
    rev = "1b77b735ea70c3dfbdab3eaa79aee48d75d3e162";
    sha256 = "";
  };

  patches = [
  ];

  # enableCompilerGcc6Quirk = true;
  # enableRemovingWerror = true;
  # isCompressed = false;
  # isModular = false;
}
