//
//  NSDecimalNumber+GTAddition.m
//  GTCategories
//
//  Created by liuxc on 2018/11/16.
//

#import "NSDecimalNumber+GTAddition.h"

@implementation NSDecimalNumber (GTAddition)

/**
 *  @brief  四舍五入 NSRoundPlain
 *
 *  @param scale 限制位数
 *
 *  @return 返回结果
 */
- (NSDecimalNumber *)gt_roundToScale:(NSUInteger)scale{
    return [self gt_roundToScale:scale mode:NSRoundPlain];
}
/**
 *  @brief  四舍五入
 *
 *  @param scale        限制位数
 *  @param roundingMode NSRoundingMode
 *
 *  @return 返回结果
 */
- (NSDecimalNumber *)gt_roundToScale:(NSUInteger)scale mode:(NSRoundingMode)roundingMode{
    NSDecimalNumberHandler * handler = [[NSDecimalNumberHandler alloc] initWithRoundingMode:roundingMode scale:scale raiseOnExactness:NO raiseOnOverflow:YES raiseOnUnderflow:YES raiseOnDivideByZero:YES];
    return [self decimalNumberByRoundingAccordingToBehavior:handler];
}

- (NSDecimalNumber*)gt_decimalNumberWithPercentage:(float)percent {
    NSDecimalNumber * percentage = [NSDecimalNumber decimalNumberWithDecimal:[[NSNumber numberWithFloat:percent] decimalValue]];
    return [self decimalNumberByMultiplyingBy:percentage];
}

- (NSDecimalNumber *)gt_decimalNumberWithDiscountPercentage:(NSDecimalNumber *)discountPercentage {
    NSDecimalNumber * hundred = [NSDecimalNumber decimalNumberWithString:@"100"];
    NSDecimalNumber * percent = [self decimalNumberByMultiplyingBy:[discountPercentage decimalNumberByDividingBy:hundred]];
    return [self decimalNumberBySubtracting:percent];
}

- (NSDecimalNumber *)gt_decimalNumberWithDiscountPercentage:(NSDecimalNumber *)discountPercentage roundToScale:(NSUInteger)scale {
    NSDecimalNumber * value = [self gt_decimalNumberWithDiscountPercentage:discountPercentage];
    return [value gt_roundToScale:scale];
}

- (NSDecimalNumber *)gt_discountPercentageWithBaseValue:(NSDecimalNumber *)baseValue {
    NSDecimalNumber * hundred = [NSDecimalNumber decimalNumberWithString:@"100"];
    NSDecimalNumber * percentage = [[self decimalNumberByDividingBy:baseValue] decimalNumberByMultiplyingBy:hundred];
    return [hundred decimalNumberBySubtracting:percentage];
}

- (NSDecimalNumber *)gt_discountPercentageWithBaseValue:(NSDecimalNumber *)baseValue roundToScale:(NSUInteger)scale {
    NSDecimalNumber * discount = [self gt_discountPercentageWithBaseValue:baseValue];
    return [discount gt_roundToScale:scale];
}


@end
