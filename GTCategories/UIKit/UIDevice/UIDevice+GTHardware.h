//
//  UIDevice+GTHardware.h
//  GTCategories
//
//  Created by liuxc on 2018/11/16.
//

#import <UIKit/UIKit.h>

@interface UIDevice (GTHardware)

+ (NSString *)gt_platform;
+ (NSString *)gt_platformString;


+ (NSString *)gt_macAddress;

//Return the current device CPU frequency
+ (NSUInteger)gt_cpuFrequency;
// Return the current device BUS frequency
+ (NSUInteger)gt_busFrequency;
//current device RAM size
+ (NSUInteger)gt_ramSize;
//Return the current device CPU number
+ (NSUInteger)gt_cpuNumber;
//Return the current device total memory

/// 获取iOS系统的版本号
+ (NSString *)gt_systemVersion;
/// 判断当前系统是否有摄像头
+ (BOOL)gt_hasCamera;
/// 获取手机内存总量, 返回的是字节数
+ (NSUInteger)gt_totalMemoryBytes;
/// 获取手机可用内存, 返回的是字节数
+ (NSUInteger)gt_freeMemoryBytes;

/// 获取手机硬盘空闲空间, 返回的是字节数
+ (long long)gt_freeDiskSpaceBytes;
/// 获取手机硬盘总空间, 返回的是字节数
+ (long long)gt_totalDiskSpaceBytes;

@end
