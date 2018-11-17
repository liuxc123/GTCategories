//
//  UIImage+GTGIF.h
//  GTCategories
//
//  Created by liuxc on 2018/11/16.
//

#import <UIKit/UIKit.h>

@interface UIImage (GTGIF)

+ (UIImage *)gt_animatedGIFNamed:(NSString *)name;

+ (UIImage *)gt_animatedGIFWithData:(NSData *)data;

- (UIImage *)gt_animatedImageByScalingAndCroppingToSize:(CGSize)size;

@end
