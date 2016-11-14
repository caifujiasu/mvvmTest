/*
 Erica Sadun, http://ericasadun.com
 iPhone Developer's Cookbook, 6.x Edition
 BSD License, Use at your own risk
 */

#import <UIKit/UIKit.h>

#define IFPGA_NAMESTRING                @"iFPGA"

#define IPHONE_1G_NAMESTRING            @"iPhone 1G"
#define IPHONE_3G_NAMESTRING            @"iPhone 3G"
#define IPHONE_3GS_NAMESTRING           @"iPhone 3GS"
#define IPHONE_4_NAMESTRING             @"iPhone 4"
#define IPHONE_4S_NAMESTRING            @"iPhone 4S"
#define IPHONE_5_NAMESTRING             @"iPhone 5"
#define IPHONE_5C_NAMESTRING            @"iPhone 5C"
#define IPHONE_5S_NAMESTRING            @"iPhone 5S"
#define IPHONE_6_NAMESTRING            @"iPhone 6"
#define IPHONE_6P_NAMESTRING            @"iPhone 6Plus"
#define IPHONE_UNKNOWN_NAMESTRING       @"Unknown iPhone"

#define IPOD_1G_NAMESTRING              @"iPod touch 1G"
#define IPOD_2G_NAMESTRING              @"iPod touch 2G"
#define IPOD_3G_NAMESTRING              @"iPod touch 3G"
#define IPOD_4G_NAMESTRING              @"iPod touch 4G"
#define IPOD_UNKNOWN_NAMESTRING         @"Unknown iPod"

#define IPAD_1G_NAMESTRING              @"iPad 1G"
#define IPAD_2G_NAMESTRING              @"iPad 2G"
#define IPAD_3G_NAMESTRING              @"iPad 3G"
#define IPAD_4G_NAMESTRING              @"iPad 4G"
#define IPAD_UNKNOWN_NAMESTRING         @"Unknown iPad"

#define APPLETV_2G_NAMESTRING           @"Apple TV 2G"
#define APPLETV_3G_NAMESTRING           @"Apple TV 3G"
#define APPLETV_4G_NAMESTRING           @"Apple TV 4G"
#define APPLETV_UNKNOWN_NAMESTRING      @"Unknown Apple TV"

#define IOS_FAMILY_UNKNOWN_DEVICE       @"Unknown iOS device"

#define SIMULATOR_NAMESTRING            @"iPhone Simulator"
#define SIMULATOR_IPHONE_NAMESTRING     @"iPhone Simulator"
#define SIMULATOR_IPAD_NAMESTRING       @"iPad Simulator"
#define SIMULATOR_APPLETV_NAMESTRING    @"Apple TV Simulator" // :)

typedef enum
{
    UIDeviceUnknown,

    UIDeviceSimulator,
    UIDeviceSimulatoriPhone,
    UIDeviceSimulatoriPad,
    UIDeviceSimulatorAppleTV,

    UIDevice1GiPhone,
    UIDevice3GiPhone,
    UIDevice3GSiPhone,
    UIDevice4iPhone,
    UIDevice4SiPhone,
    UIDevice5iPhone,
    UIDevice5CiPhone,
    UIDevice5SiPhone,
    UIDevice6iPhone,
    UIDevice6PiPhone,

    UIDevice1GiPod,
    UIDevice2GiPod,
    UIDevice3GiPod,
    UIDevice4GiPod,

    UIDevice1GiPad,
    UIDevice2GiPad,
    UIDevice3GiPad,
    UIDevice4GiPad,

    UIDeviceAppleTV2,
    UIDeviceAppleTV3,
    UIDeviceAppleTV4,

    UIDeviceUnknowniPhone,
    UIDeviceUnknowniPod,
    UIDeviceUnknowniPad,
    UIDeviceUnknownAppleTV,
    UIDeviceIFPGA,

} UIDevicePlatform;

typedef enum
{
    UIDeviceFamilyiPhone,
    UIDeviceFamilyiPod,
    UIDeviceFamilyiPad,
    UIDeviceFamilyAppleTV,
    UIDeviceFamilyUnknown,

} UIDeviceFamily;
#define HARDWARE @{@"i386": @"Simulator",@"x86_64": @"Simulator",@"iPod1,1": @"iPod Touch",@"iPod2,1": @"iPod Touch 2nd Generation",@"iPod3,1": @"iPod Touch 3rd Generation",@"iPod4,1": @"iPod Touch 4th Generation",@"iPhone1,1": @"iPhone",@"iPhone1,2": @"iPhone 3G",@"iPhone2,1": @"iPhone 3GS",@"iPhone3,1": @"iPhone 4",@"iPhone4,1": @"iPhone 4S",@"iPhone5,1": @"iPhone 5",@"iPhone5,2": @"iPhone 5",@"iPhone5,3": @"iPhone 5c",@"iPhone5,4": @"iPhone 5c",@"iPhone6,1": @"iPhone 5s",@"iPhone6,2": @"iPhone 5s",@"iPad1,1": @"iPad",@"iPad2,1": @"iPad 2",@"iPad3,1": @"iPad 3rd Generation ",@"iPad3,4": @"iPad 4th Generation ",@"iPad2,5": @"iPad Mini",@"iPad4,4": @"iPad Mini 2nd Generation - Wifi",@"iPad4,5": @"iPad Mini 2nd Generation - Cellular",@"iPad4,1": @"iPad Air 5th Generation - Wifi",@"iPad4,2": @"iPad Air 5th Generation - Cellular",@"iPhone7,1": @"iPhone 6 Plus",@"iPhone7,2": @"iPhone 6",@"iPhone8,1": @"iPhone 6S",@"iPhone8,2": @"iPhone 6S"}

@interface UIDevice (Hardware)
- (NSString *)platform;

- (NSString *)hwmodel;

- (NSUInteger)platformType;

- (NSString *)platformString;

- (NSUInteger)cpuFrequency;

- (NSUInteger)busFrequency;

- (NSUInteger)cpuCount;

- (NSUInteger)totalMemory;

- (NSUInteger)userMemory;

- (NSNumber *)totalDiskCapacity;

- (NSNumber *)freeDiskSpace;

- (NSString *)macaddress;

- (BOOL)hasRetinaDisplay;

- (UIDeviceFamily)deviceFamily;

- (NSString *)uniqueID;

- (NSString *)currentWifiSSID;

+ (NSInteger)getCurrentSystemVersionNumber;

- (NSString *)machineName;

@end
