{ config, lib, pkgs, ... }:

{

  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  services.tlp.enable = lib.mkDefault (
    (lib.versionOlder (lib.versions.majorMinor lib.version) "21.05")
    || !config.services.power-profiles-daemon.enable
  );
  services.throttled.enable = lib.mkDefault true;
  services.thermald.enable = true;

  boot.kernelParams = [
    "mem_sleep_default=deep"   # Force S3 sleep mode
    "i915.enable_guc=2"
    "i915.enable_fbc=1"
    "i915.enable_psr=2"
    "intel_iommu=on"
    "iommu=pt"
  ];

  boot.blacklistedKernelModules = [ "psmouse" ];

  hardware.intelgpu.vaapiDriver = "intel-media-driver";

  boot.loader.systemd-boot.enable = lib.mkForce false; 
  boot.loader.efi.canTouchEfiVariables = true;

  boot.lanzaboote = {
    enable = true;
    pkiBundle = "/var/lib/sbctl";
  };

  environment.systemPackages = with pkgs; [
    sbctl
  ];
}
