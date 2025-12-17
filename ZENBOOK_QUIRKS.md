## Sound not working

disabling fast book in the bios seem to do the trick.


## Slow graphics perfs

hybrid graphics with Intel iGPU and Geforce MX250 doesn't work out of the box on most distro. needs a bit of setup to solve graphics perf loss.

#### Install requirements

```
# NVIDIA drivers (use DKMS for kernel compatibility)
sudo pacman -S nvidia-dkms nvidia-utils nvidia-settings nvidia-prime lib32-nvidia-utils linux-headers

# Intel graphics and VA-API
sudo pacman -S mesa vulkan-intel intel-media-driver libva libva-utils

# Hyprland and Wayland essentials
sudo pacman -S hyprland xdg-desktop-portal-hyprland qt5-wayland qt6-wayland egl-wayland xorg-xwayland wayland-protocols
```

#### Config environment

Edit `/etc/modprobe.d/nvidia.conf`:
```
options nvidia_drm modeset=1
options nvidia_drm fbdev=1
options nvidia NVreg_PreserveVideoMemoryAllocations=1
```

Edit `/etc/mkinitcpio.conf`:
```
# Add NVIDIA modules (i915 first for hybrid stability)
MODULES=(i915 nvidia nvidia_modeset nvidia_uvm nvidia_drm)

# Remove 'kms' from HOOKS to prevent nouveau loading
HOOKS=(base udev autodetect modconf keyboard keymap block filesystems fsck)
```

Refresh:
```bash
sudo mkinitcpio -P
```

Add drm config to bootloader `/boot/limine.cfg` (`nvidia_drm.modeset=1 nvidia_drm.fbdev=1`):
```
:Arch Linux
    PROTOCOL=linux
    KERNEL_PATH=boot:///vmlinuz-linux
    CMDLINE=root=UUID=<your-uuid> rw nvidia_drm.modeset=1 nvidia_drm.fbdev=1
    MODULE_PATH=boot:///initramfs-linux.img
```

Config hyprland:
```
# === GPU CONFIGURATION ===
# Use Intel for VA-API video decoding (crucial for performance)
env = LIBVA_DRIVER_NAME,iHD
env = VDPAU_DRIVER,va_gl

# NVIDIA compositor rendering
env = GBM_BACKEND,nvidia-drm
env = __GLX_VENDOR_LIBRARY_NAME,nvidia

# Multi-GPU ordering (Intel primary for battery, NVIDIA secondary)
# Find your paths with: ls -la /dev/dri/by-path/
env = AQ_DRM_DEVICES,/dev/dri/card0:/dev/dri/card1

# === SESSION VARIABLES ===
env = XDG_SESSION_TYPE,wayland
env = XDG_SESSION_DESKTOP,Hyprland
env = XDG_CURRENT_DESKTOP,Hyprland

# === TOOLKIT WAYLAND SUPPORT ===
env = GDK_BACKEND,wayland,x11,*
env = QT_QPA_PLATFORM,wayland;xcb
env = SDL_VIDEODRIVER,wayland
env = MOZ_ENABLE_WAYLAND,1
env = ELECTRON_OZONE_PLATFORM_HINT,wayland

# === NVIDIA WORKAROUNDS ===
cursor {
    no_hardware_cursors = true
}

misc {
    vrr = 0
    vfr = true
}
```

Enable nvidia power management services:
```bash
sudo systemctl enable nvidia-suspend.service nvidia-hibernate.service nvidia-resume.service
```

Reboot.

#### Make sure its working

```bash
vainfo
```

Expected output:
```
vainfo: Driver version: Intel iHD driver for Intel(R) Gen Graphics
vainfo: Supported profile and entrypoints
      VAProfileH264Main               : VAEntrypointVLD
      VAProfileHEVCMain               : VAEntrypointVLD
      VAProfileVP9Profile0            : VAEntrypointVLD
```
