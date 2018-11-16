//
//  NSNumber+GTCGFloat.h
//  FBSnapshotTestCase
//
//  Created by liuxc on 2018/11/16.
//

#import <Foundation/Foundation.h>

@interface NSNumber (GTCGFloat)

- (CGFloat)gt_CGFloatValue;

- (id)initWithGTCGFloat:(CGFloat)value;

+ (NSNumber *)gt_numberWithCGFloat:(CGFloat)value;

@end
