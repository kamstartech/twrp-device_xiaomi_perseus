#include <stdlib.h>

// MultiROM init devices for Perseus (Xiaomi Mi MIX 3)
void mr_init_devices(void)
{
    // Initialize framebuffer
    system("echo 1 > /sys/class/graphics/fb0/state");
    
    // Initialize input devices
    system("chmod 644 /dev/input/*");
    
    // Initialize block devices - Updated for logical partitions
    system("mknod /dev/block/bootdevice/by-name/boot b 259 1");
    system("mknod /dev/block/bootdevice/by-name/recovery b 259 2");
    system("mknod /dev/block/bootdevice/by-name/super b 259 3");
    system("mknod /dev/block/bootdevice/by-name/userdata b 259 4");
    
    // Initialize logical partition mapper devices
    system("mkdir -p /dev/block/mapper");
    // Note: Logical partitions will be handled by device mapper
}