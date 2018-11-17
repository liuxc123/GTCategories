//
//  UIImage+GTBetterFace.h
//  GTCategories
//
//  Created by liuxc on 2018/11/16.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, GTAccuracy) {
    GTAccuracyLow = 0,
    GTAccuracyHigh,
};

@interface UIImage (GTBetterFace)

- (UIImage *)gt_betterFaceImageForSize:(CGSize)size
                              accuracy:(GTAccuracy)accurary;

@end
