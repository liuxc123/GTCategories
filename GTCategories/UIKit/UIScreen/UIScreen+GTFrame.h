//
//  UIScreen+GTFrame.h
//  GTCategories
//
//  Created by liuxc on 2018/11/16.
//

#import <UIKit/UIKit.h>

@interface UIScreen (GTFrame)

+ (CGSize)gt_size;
+ (CGFloat)gt_width;
+ (CGFloat)gt_height;

+ (CGSize)gt_orientationSize;
+ (CGFloat)gt_orientationWidth;
+ (CGFloat)gt_orientationHeight;
+ (CGSize)gt_DPISize;

@end
