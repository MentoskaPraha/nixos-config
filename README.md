# NixOS Configuration

This is my configuration flake for NixOS ensuring all my computers have the same configuration.

Certain machines don't have Disk Encryption or Secure Boot or have different timezones.

## Updating

The flake is updated automatically every day at 05:00 UTC. This command will update the flake manually if needed (must be in same directory as flake.nix):

```sh
nix flake update
```

All that needs to be done is for those changes to be synced via git and the system to be rebuilt like so:

```sh
nixos-rebuild switch --sudo --flake ~/path_to_flake#system_hostname
```

Flatpak applications need to be updated separately and manually like so:

```sh
flatpak update -y
```

Updating the firmware on Framework devices is done with the following 3 commands:

>[!note]
>You must be plugged into AC power and LVFS may not update if the battery is at 100%.
>If you experience issues while the battery is at 100%, discharge to 95%, plug AC back in, then re-run `fwupdmgr update`.

```sh
fwupdmgr refresh --force
fwupdmgr get-updates
fwupdmgr update
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
- Login Everywhere

## To Do

- [X] Setup Flatpak Apps
  - [X] Discord
  - [X] Sober
  - [X] EDMC
  - [X] Proton VPN
- [X] Setup libratbag & piper
- [X] Setup Wireguard VPN
- [ ] Nix Shell for dev environments
- [X] Desktop Mouse config in KDE Settings 
- [X] Missing Apps
  - [X] Cartriges for games
  - [X] btop
  - [X] GPU Screen Recorder
  - [X] Newsflash
  - [X] Obsidian

## Credits

Unfortunately I'm not a perfect, so a decent chunk of the things in this configuration weren't written by me. Here's everyone else who contributed somehow:

- [Siddharth More](https://gitlab.com/sidmoreoss) from whom I "borrowed" the [user icon logic](./system/modules/user_icon.nix) (the original code can be found [here](https://gitlab.com/lazylinux/nixos/-/blob/main/modules/users/icon.nix)).
- Claude - for helping debug and write some of the components.
- All the amazing game developers who made the games for which I have [banners](./assets/game_banners) (They're not the only games I play, just the only one that didn't automatically pull assets into [Cartriges](https://apps.gnome.org/Cartridges/) for some reason)

Thank you to everyone!
