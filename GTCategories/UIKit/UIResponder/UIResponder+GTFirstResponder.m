//
//  UIResponder+GTFirstResponder.m
//  GTCategories
//
//  Created by liuxc on 2018/11/16.
//

#import "UIResponder+GTFirstResponder.h"

static __weak id gt_currentFirstResponder;

@implementation UIResponder (GTFirstResponder)

/**
 *  @brief  当前第一响应者
 *
 *  @return 当前第一响应者
 */
+ (id)gt_currentFirstResponder {
    gt_currentFirstResponder = nil;

    [[UIApplication sharedApplication] sendAction:@selector(gt_findCurrentFirstResponder:) to:nil from:nil forEvent:nil];

    return gt_currentFirstResponder;
}

- (void)gt_findCurrentFirstResponder:(id)sender {
    gt_currentFirstResponder = self;
}


@end
