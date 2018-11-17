//
//  NSObject+GTBlocks.m
//  GTCategories
//
//  Created by liuxc on 2018/11/16.
//

#import "NSObject+GTBlocks.h"
#import <dispatch/dispatch.h>

static inline dispatch_time_t gt_dTimeDelay(NSTimeInterval time) {
    int64_t delta = (int64_t)(NSEC_PER_SEC * time);
    return dispatch_time(DISPATCH_TIME_NOW, delta);
}

@implementation NSObject (GTBlocks)

+ (id)gt_performBlock:(void (^)(void))block afterDelay:(NSTimeInterval)delay {
    if (!block) return nil;

    __block BOOL cancelled = NO;

    void (^wrappingBlock)(BOOL) = ^(BOOL cancel) {
        if (cancel) {
            cancelled = YES;
            return;
        }
        if (!cancelled)block();
    };

    wrappingBlock = [wrappingBlock copy];

    dispatch_after(gt_dTimeDelay(delay), dispatch_get_main_queue(), ^{  wrappingBlock(NO); });

    return wrappingBlock;
}

+ (id)gt_performBlock:(void (^)(id arg))block withObject:(id)anObject afterDelay:(NSTimeInterval)delay {
    if (!block) return nil;

    __block BOOL cancelled = NO;

    void (^wrappingBlock)(BOOL, id) = ^(BOOL cancel, id arg) {
        if (cancel) {
            cancelled = YES;
            return;
        }
        if (!cancelled) block(arg);
    };

    wrappingBlock = [wrappingBlock copy];

    dispatch_after(gt_dTimeDelay(delay), dispatch_get_main_queue(), ^{  wrappingBlock(NO, anObject); });

    return wrappingBlock;
}

- (id)gt_performBlock:(void (^)(void))block afterDelay:(NSTimeInterval)delay {

    if (!block) return nil;

    __block BOOL cancelled = NO;

    void (^wrappingBlock)(BOOL) = ^(BOOL cancel) {
        if (cancel) {
            cancelled = YES;
            return;
        }
        if (!cancelled) block();
    };

    wrappingBlock = [wrappingBlock copy];

    dispatch_after(gt_dTimeDelay(delay), dispatch_get_main_queue(), ^{  wrappingBlock(NO); });

    return wrappingBlock;
}

- (id)gt_performBlock:(void (^)(id arg))block withObject:(id)anObject afterDelay:(NSTimeInterval)delay {
    if (!block) return nil;

    __block BOOL cancelled = NO;

    void (^wrappingBlock)(BOOL, id) = ^(BOOL cancel, id arg) {
        if (cancel) {
            cancelled = YES;
            return;
        }
        if (!cancelled) block(arg);
    };

    wrappingBlock = [wrappingBlock copy];

    dispatch_after(gt_dTimeDelay(delay), dispatch_get_main_queue(), ^{  wrappingBlock(NO, anObject); });

    return wrappingBlock;
}

+ (void)gt_cancelBlock:(id)block {
    if (!block) return;
    void (^aWrappingBlock)(BOOL) = (void(^)(BOOL))block;
    aWrappingBlock(YES);
}

+ (void)gt_cancelPreviousPerformBlock:(id)aWrappingBlockHandle {
    [self gt_cancelBlock:aWrappingBlockHandle];
}

@end
