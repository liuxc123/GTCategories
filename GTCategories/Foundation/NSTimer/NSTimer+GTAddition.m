//
//  NSTimer+GTAddition.m
//  GTCategories
//
//  Created by liuxc on 2018/11/16.
//

#import "NSTimer+GTAddition.h"

@implementation NSTimer (GTAddition)

/**
 *  @brief  暂停NSTimer
 */
-(void)gt_pauseTimer
{
    if (![self isValid]) {
        return ;
    }
    [self setFireDate:[NSDate distantFuture]];
}
/**
 *  @brief  开始NSTimer
 */
-(void)gt_resumeTimer
{
    if (![self isValid]) {
        return ;
    }
    [self setFireDate:[NSDate date]];
}
/**
 *  @brief  延迟开始NSTimer
 */
- (void)gt_resumeTimerAfterTimeInterval:(NSTimeInterval)interval
{
    if (![self isValid]) {
        return ;
    }
    [self setFireDate:[NSDate dateWithTimeIntervalSinceNow:interval]];
}

@end
