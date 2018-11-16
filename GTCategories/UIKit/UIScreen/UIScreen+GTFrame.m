//
//  UIScreen+GTFrame.m
//  FBSnapshotTestCase
//
//  Created by liuxc on 2018/11/16.
//

#import "UIScreen+GTFrame.h"

@implementation UIScreen (GTFrame)

+ (CGSize)gt_size
{
    return [[UIScreen mainScreen] bounds].size;
}

+ (CGFloat)gt_width
{
    return [[UIScreen mainScreen] bounds].size.width;
}

+ (CGFloat)gt_height
{
    return [[UIScreen mainScreen] bounds].size.height;
}

+ (CGSize)gt_orientationSize
{
    CGFloat systemVersion = [[[UIDevice currentDevice] systemVersion]
                             doubleValue];
    BOOL isLand =   UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation);
    return (systemVersion>8.0 && isLand) ? gt_SizeSWAP([UIScreen gt_size]) : [UIScreen gt_size];
}

+ (CGFloat)gt_orientationWidth
{
    return [UIScreen gt_orientationSize].width;
}

+ (CGFloat)gt_orientationHeight
{
    return [UIScreen gt_orientationSize].height;
}

+ (CGSize)gt_DPISize
{
    CGSize size = [[UIScreen mainScreen] bounds].size;
    CGFloat scale = [[UIScreen mainScreen] scale];
    return CGSizeMake(size.width * scale, size.height * scale);
}


/**
 *  交换高度与宽度
 */
static inline CGSize gt_SizeSWAP(CGSize size) {
    return CGSizeMake(size.height, size.width);
}

@end
