//
//  NSObject+GTGCD.h
//  GTCategories
//
//  Created by liuxc on 2018/11/16.
//

#import <Foundation/Foundation.h>

@interface NSObject (GTGCD)

/**
 *  @brief  异步执行代码块
 *
 *  @param block 代码块
 */
- (void)gt_performAsynchronous:(void(^)(void))block;
/**
 *  @brief  GCD主线程执行代码块
 *
 *  @param block 代码块
 *  @param wait  是否同步请求
 */
- (void)gt_performOnMainThread:(void(^)(void))block wait:(BOOL)wait;

/**
 *  @brief  延迟执行代码块
 *
 *  @param seconds 延迟时间 秒
 *  @param block   代码块
 */
- (void)gt_performAfter:(NSTimeInterval)seconds block:(void(^)(void))block;

@end
