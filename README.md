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
  - Display Configuration
  - Internet & Bluetooth
  - Printers

## To Do

- [ ] Setup Flatpak Apps
  - [ ] Discord
  - [ ] Sober
  - [ ] EDMC
  - [ ] Proton VPN
  - [ ] Proton Mail
- [ ] Setup libratbag & piper
- [ ] Setup Wireguard VPN
- [ ] Nix Shell for dev environments
- [ ] Desktop Mouse config in KDE Settings 
- [ ] Missing Apps
  - [ ] Cartriges for games
  - [ ] btop
  - [ ] GPU Screen Recorder
  - [ ] Calendar (sync with Nextcloud)
  - [ ] Contacts (sync with Nextcloud)
  - [ ] Newsflash
  - [ ] Obsidian

## Credits

Unfortunately I'm not a perfect, so a decent chunk of the things in this configuration weren't written by me. Here's everyone else who contributed somehow:

- [Siddharth More](https://gitlab.com/sidmoreoss) from whom I "borrowed" the [user icon logic](./system/modules/user_icon.nix) (the original code can be found [here](https://gitlab.com/lazylinux/nixos/-/blob/main/modules/users/icon.nix)).
- Claude - for helping debug and write some of the components.

Thank you to everyone!
