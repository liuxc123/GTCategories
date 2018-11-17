//
//  NSInvocation+GTBlocks.h
//  GTCategories
//
//  Created by liuxc on 2018/11/16.
//
// NSInvocation category to create NSInvocation with block
// https://github.com/deput/NSInvocation-Block

#import <Foundation/Foundation.h>

@interface NSInvocation (GTBlocks)

+ (instancetype)gt_invocationWithBlock:(id) block;
+ (instancetype)gt_invocationWithBlockAndArguments:(id) block ,...;

@end
