# TWRP 3.7.1 + MultiROM Device Tree for Xiaomi Mi Mix 3 (Perseus)

Advanced TWRP device tree with **MultiROM support** and **logical partition compatibility** for modern Android ROMs.

## 🚀 Key Features

### ✅ TWRP 3.7.1 Enhanced
- **Logical Partition Support** - Compatible with LineageOS 22 and modern ROMs
- **Dynamic Partitions** - Full support for super partition and logical volumes
- **Enhanced fstab** - Hybrid physical/logical partition mapping
- **Improved Performance** - Optimized for modern hardware

### ✅ MultiROM Ready
- **Full MultiROM Support** - Boot multiple ROMs from one device
- **Logical Partition Compatible** - Works with modern partition layouts
- **Device-Specific Hooks** - Optimized for Perseus hardware
- **Kexec Support** - Proper memory management for multi-boot
- **HDpi Theme** - High-resolution display support

### ✅ Hardware Support
- ✅ ADB and Fastboot
- ✅ MTP (Media Transfer Protocol)
- ✅ USB OTG
- ✅ Screen brightness control
- ✅ Correct screenshot colors
- ✅ Backup/Restore (NANDroid)
- ✅ ROM/Recovery flashing
- ✅ LineageOS 22 compatibility
- ✅ Android 15 support
- ❌ Data decryption (temporarily disabled for troubleshooting)
- ❌ Vibration (work in progress)

## 🛠️ Build Instructions

### Prerequisites
First, set up TWRP 3.7.1 build environment:

```bash
# Initialize TWRP 3.7.1 tree
repo init -u https://github.com/minimal-manifest-twrp/platform_manifest_twrp_aosp.git -b twrp-12.1
repo sync -j8
```

### Add Device Tree
Add this device tree to your `.repo/local_manifests/roomservice.xml`:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<manifest>
  <project path="device/xiaomi/perseus" 
           name="kamstartech/twrp-device_xiaomi_perseus" 
           remote="github" 
           revision="main" />
</manifest>
```

### Build Commands
```bash
# Set up build environment
export ALLOW_MISSING_DEPENDENCIES=true
export LC_ALL=C

# Configure build
. build/envsetup.sh
lunch twrp_perseus-eng

# Build TWRP
mka recoveryimage -j$(nproc --all)

# Build MultiROM (optional)
mka multirom -j$(nproc --all)
```

### Flash & Test
```bash
# Test boot (recommended first)
fastboot boot out/target/product/perseus/recovery.img

# Permanent flash (after testing)
fastboot flash recovery out/target/product/perseus/recovery.img
fastboot reboot recovery
```

## 🔧 Configuration Details

### Logical Partitions
This device tree supports both traditional and logical partitions:
- **Physical**: `/dev/block/bootdevice/by-name/*`
- **Logical**: `/dev/block/mapper/*` (system, vendor, product, system_ext, odm)
- **Super**: Dynamic partition container for logical volumes

### MultiROM Configuration
- **Input Type**: Type B (hardware buttons)
- **DPI**: HDpi with 1.5x multiplier
- **Kexec Memory**: Minimum 512MB (0x20000000)
- **DTB Support**: Enabled for proper hardware initialization
- **Logical Partition Support**: Full compatibility

## 📁 Key Files

| File | Description |
|------|-------------|
| `BoardConfig.mk` | Main configuration with logical partition support |
| `recovery.fstab` | Enhanced partition mapping (physical + logical) |
| `mr_hooks.c` | MultiROM device-specific initialization hooks |
| `mr_init_devices.c` | Device hardware initialization for MultiROM |
| `mr_recovery_hooks.c` | Recovery-specific MultiROM integration |
| `vendor.prop` | Vendor properties for compatibility |

## 🔄 Version History

- **v3.7.1+MultiROM** - Current: Full logical partition + MultiROM support
- **v3.6.0** - Previous: Basic TWRP with limited partition support

## 🤝 Contributing

Contributions welcome! Please:
1. Fork this repository
2. Create a feature branch
3. Test thoroughly on Perseus hardware
4. Submit pull request with detailed description

## 🙏 Credits & Thanks

- **mauronofrio** - Original Perseus TWRP device tree
- **TeamWin** - TWRP Recovery Project
- **Tasssadar** - MultiROM Project
- **LineageOS Team** - Modern Android partition support
- **kamstartech** - TWRP 3.7.1 + MultiROM integration and logical partition support

## 📞 Support

- **Device**: Xiaomi Mi Mix 3 (Perseus)
- **Chipset**: Qualcomm SDM845 (Snapdragon 845)
- **Architecture**: ARM64 + ARM32
- **Status**: Active development

---
**Built for the community by [@kamstartech](https://github.com/kamstartech)** 🚀

