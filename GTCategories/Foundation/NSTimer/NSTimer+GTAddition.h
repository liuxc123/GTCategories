//
//  NSTimer+GTAddition.h
//  GTCategories
//
//  Created by liuxc on 2018/11/16.
//

#import <Foundation/Foundation.h>

@interface NSTimer (GTAddition)

/**
 *  @brief  暂停NSTimer
 */
- (void)gt_pauseTimer;
/**
 *  @brief  开始NSTimer
 */
- (void)gt_resumeTimer;
/**
 *  @brief  延迟开始NSTimer
 */
- (void)gt_resumeTimerAfterTimeInterval:(NSTimeInterval)interval;

@end
