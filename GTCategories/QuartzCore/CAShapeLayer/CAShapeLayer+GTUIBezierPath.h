//
//  CAShapeLayer+GTUIBezierPath.h
//  GTCategories
//
//  Created by liuxc on 2018/11/16.
//

#import <QuartzCore/QuartzCore.h>

#if __has_feature(nullability) // Xcode 6.3+
#pragma clang assume_nonnull begin
#else
#define nullable
#define __nullable
#endif

/**
 Category on `CAShapeLayer`, that allows setting and getting UIBezierPath on CAShapeLayer.
 */
@interface CAShapeLayer (GTUIBezierPath)

/**
 Update CAShapeLayer with UIBezierPath.
 */
- (void)gt_updateWithBezierPath:(UIBezierPath *)path;

/**
 Get UIBezierPath object, constructed from CAShapeLayer.
 */
- (UIBezierPath*)gt_bezierPath;

@end

#if __has_feature(nullability)
#pragma clang assume_nonnull end
#endif
