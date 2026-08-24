# NixOS Configuration

This is my configuration flake for NixOS ensuring all my computers have the same configuration.

Certain machines don't have Disk Encryption or Secure Boot or have different timezones.

## Updating

This command will update the flake (must be in same directory as flake.nix):

```sh
nix flake update
```

Afterwards the system can be rebuilt like so:

```sh
nixos-rebuild switch --sudo --flake ~/path_to_flake#system_hostname
```

## Installing on a new Machine

When installing on a new machine, use the graphical installer to setup the basic system. Then clone this repo and rebuild to use it.

Disk should be partitioned to include a 1GB boot partition, an ext4 root partition and a swap partition for system hibernation at the end. All should be encrypted (except the boot partition, duh).

Ensure the following is setup:
- User Passwords (lock root, set user password)
- Disk Encryption Password
- Disk Encryption FIDO2 Keys (both primary and backup)
- Clean out systemd-boot remains (we use Limine in this house)
- Secure Boot (if applicable)
- Certain Settings in Plasma
  - Finger Print Login (if applicable)
  - SDDM Theming
  - Display Configuration
    - Including Screen Edges (should be disabled)
  - Internet & Bluetooth
  - Printers
  - Set User Profile Picture

## To Do

- [ ] Setup Flatpak Apps
- [ ] Setup libratbag & piper
- [ ] Nix Shell for dev environments
