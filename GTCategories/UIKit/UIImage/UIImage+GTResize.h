//
//  UIImage+GTResize.h
//  FBSnapshotTestCase
//
//  Created by liuxc on 2018/11/16.
//

#import <UIKit/UIKit.h>

@interface UIImage (GTResize)

- (UIImage *)gt_croppedImage:(CGRect)bounds;
- (UIImage *)gt_thumbnailImage:(NSInteger)thumbnailSize
             transparentBorder:(NSUInteger)borderSize
                  cornerRadius:(NSUInteger)cornerRadius
          interpolationQuality:(CGInterpolationQuality)quality;
- (UIImage *)gt_resizedImage:(CGSize)newSize
        interpolationQuality:(CGInterpolationQuality)quality;
- (UIImage *)gt_resizedImageWithContentMode:(UIViewContentMode)contentMode
                                     bounds:(CGSize)bounds
                       interpolationQuality:(CGInterpolationQuality)quality;

@end
