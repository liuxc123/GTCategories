//
//  NSNumber+GTCGFloat.m
//  GTCategories
//
//  Created by liuxc on 2018/11/16.
//

#import "NSNumber+GTCGFloat.h"

@implementation NSNumber (GTCGFloat)

- (CGFloat)gt_CGFloatValue
{
#if (CGFLOAT_IS_DOUBLE == 1)
    CGFloat result = [self doubleValue];
#else
    CGFloat result = [self floatValue];
#endif
    return result;
}

- (id)initWithGTCGFloat:(CGFloat)value
{
#if (CGFLOAT_IS_DOUBLE == 1)
    self = [self initWithDouble:value];
#else
    self = [self initWithFloat:value];
#endif
    return self;
}

+ (NSNumber *)gt_numberWithCGFloat:(CGFloat)value
{
    NSNumber *result = [[self alloc] initWithGTCGFloat:value];
    return result;
}

@end
