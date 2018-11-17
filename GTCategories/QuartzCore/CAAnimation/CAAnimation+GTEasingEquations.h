//
//  CAAnimation+GTEasingEquations.h
//  GTCategories
//
//  Created by liuxc on 2018/11/16.
//

#import <QuartzCore/QuartzCore.h>

typedef NS_ENUM(NSInteger, CAAnimationEasingFunction) {
    CAAnimationEasingFunctionLinear,

    CAAnimationEasingFunctionEaseInQuad,
    CAAnimationEasingFunctionEaseOutQuad,
    CAAnimationEasingFunctionEaseInOutQuad,

    CAAnimationEasingFunctionEaseInCubic,
    CAAnimationEasingFunctionEaseOutCubic,
    CAAnimationEasingFunctionEaseInOutCubic,

    CAAnimationEasingFunctionEaseInQuartic,
    CAAnimationEasingFunctionEaseOutQuartic,
    CAAnimationEasingFunctionEaseInOutQuartic,

    CAAnimationEasingFunctionEaseInQuintic,
    CAAnimationEasingFunctionEaseOutQuintic,
    CAAnimationEasingFunctionEaseInOutQuintic,

    CAAnimationEasingFunctionEaseInSine,
    CAAnimationEasingFunctionEaseOutSine,
    CAAnimationEasingFunctionEaseInOutSine,

    CAAnimationEasingFunctionEaseInExponential,
    CAAnimationEasingFunctionEaseOutExponential,
    CAAnimationEasingFunctionEaseInOutExponential,

    CAAnimationEasingFunctionEaseInCircular,
    CAAnimationEasingFunctionEaseOutCircular,
    CAAnimationEasingFunctionEaseInOutCircular,

    CAAnimationEasingFunctionEaseInElastic,
    CAAnimationEasingFunctionEaseOutElastic,
    CAAnimationEasingFunctionEaseInOutElastic,

    CAAnimationEasingFunctionEaseInBack,
    CAAnimationEasingFunctionEaseOutBack,
    CAAnimationEasingFunctionEaseInOutBack,

    CAAnimationEasingFunctionEaseInBounce,
    CAAnimationEasingFunctionEaseOutBounce,
    CAAnimationEasingFunctionEaseInOutBounce
};

@interface CAAnimation (GTEasingEquations)

+ (CAKeyframeAnimation*)gt_transformAnimationWithDuration:(CGFloat)duration
                                                     from:(CATransform3D)startValue
                                                       to:(CATransform3D)endValue
                                           easingFunction:(CAAnimationEasingFunction)easingFunction;

+ (void)gt_addAnimationToLayer:(CALayer *)layer
                      duration:(CGFloat)duration
                     transform:(CATransform3D)transform
                easingFunction:(CAAnimationEasingFunction)easingFunction;

+ (CAKeyframeAnimation*)gt_animationWithKeyPath:(NSString *)keyPath
                                       duration:(CGFloat)duration
                                           from:(CGFloat)startValue
                                             to:(CGFloat)endValue
                                 easingFunction:(CAAnimationEasingFunction)easingFunction;

+ (void)gt_addAnimationToLayer:(CALayer *)layer
                   withKeyPath:(NSString *)keyPath
                      duration:(CGFloat)duration
                            to:(CGFloat)endValue
                easingFunction:(CAAnimationEasingFunction)easingFunction;

+ (void)gt_addAnimationToLayer:(CALayer *)layer
                   withKeyPath:(NSString *)keyPath
                      duration:(CGFloat)duration
                          from:(CGFloat)startValue
                            to:(CGFloat)endValue
                easingFunction:(CAAnimationEasingFunction)easingFunction;

@end
