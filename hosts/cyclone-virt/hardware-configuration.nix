{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modlesPath + "/profiles/qemu-guest.nix")
    ];

  boot.initrd.availableKernelModules = [ "ahci" "xhci_pci" "virtio_pci" "sr_mod" "virtio_blk" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
  { device = "dev/disk/by-uuid/ae81476f-28b0-49ce-9bcc-88004415dc6a"};
    fsType = "ext4";
  };

  swapDevices =  [ ];

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
