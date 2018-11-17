//
//  CATransaction+GTAnimateWithDuration.m
//  GTCategories
//
//  Created by liuxc on 2018/11/16.
//

#import "CATransaction+GTAnimateWithDuration.h"

@implementation CATransaction (GTAnimateWithDuration)

/**
 *  @author Denys Telezhkin
 *
 *  @brief  CATransaction 动画执 block回调
 *
 *  @param duration   动画时间
 *  @param animations 动画块
 *  @param completion 动画结束回调
 */
+(void)gt_animateWithDuration:(NSTimeInterval)duration
                   animations:(void (^)(void))animations
                   completion:(void (^)(void))completion
{
    [CATransaction begin];
    [CATransaction setAnimationDuration:duration];

    if (completion)
    {
        [CATransaction setCompletionBlock:completion];
    }

    if (animations)
    {
        animations();
    }
    [CATransaction commit];
}

@end
