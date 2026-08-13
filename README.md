# NixOS Configuration

This is my configuration flake for NixOS ensuring all my computers have the same configuration.

Certain machines don't have Disk Encryption or Secure Boot or have different timezones.

## Manual Configuration on Install

The following must be manually configured during install:

- Disk Partitions
- Disk Encryption (if any)
- User Password (SUPER IMPORTANT)
