//
//  UIImage+GTBlur.h
//  FBSnapshotTestCase
//
//  Created by liuxc on 2018/11/16.
//

#import <UIKit/UIKit.h>

@interface UIImage (GTBlur)

- (UIImage *)gt_lightImage;
- (UIImage *)gt_extraLightImage;
- (UIImage *)gt_darkImage;
- (UIImage *)gt_tintedImageWithColor:(UIColor *)tintColor;

- (UIImage *)gt_blurredImageWithRadius:(CGFloat)blurRadius;
- (UIImage *)gt_blurredImageWithSize:(CGSize)blurSize;
- (UIImage *)gt_blurredImageWithSize:(CGSize)blurSize
                           tintColor:(UIColor *)tintColor
               saturationDeltaFactor:(CGFloat)saturationDeltaFactor
                           maskImage:(UIImage *)maskImage;

@end
