# NixOS Configuration

This is my configuration flake for NixOS ensuring all my computers have the same configuration.

Certain machines don't have Disk Encryption or Secure Boot or have different timezones.

## Installing on a new Machine

When installing on a new machine, use the graphical installer to setup the basic system. Then clone this repo and rebuild to use it.

Disk should be partitioned to include a 1GB boot partition, an ext4 root partition and a swap partition for system hibernation at the end. All should be encrypted.

Ensure the following is setup:
- User Passwords
- Disk Encryption Password
- Disk Encryption FIDO2 Keys (both primary and backup)
- Secure Boot (if applicable)
