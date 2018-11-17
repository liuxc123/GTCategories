//
//  NSObject+GTBlocks.h
//  GTCategories
//
//  Created by liuxc on 2018/11/16.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSObject (GTBlocks)

+ (id)gt_performBlock:(void (^)(void))block afterDelay:(NSTimeInterval)delay;
+ (id)gt_performBlock:(void (^)(id arg))block withObject:(id)anObject afterDelay:(NSTimeInterval)delay;
- (id)gt_performBlock:(void (^)(void))block afterDelay:(NSTimeInterval)delay;
- (id)gt_performBlock:(void (^)(id arg))block withObject:(id)anObject afterDelay:(NSTimeInterval)delay;
+ (void)gt_cancelBlock:(id)block;
+ (void)gt_cancelPreviousPerformBlock:(id)aWrappingBlockHandle __attribute__ ((deprecated));

@end
