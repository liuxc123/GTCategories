//
//  NSNumber+GTRomanNumerals.h
//  GTCategories
//
//  Created by liuxc on 2018/11/16.
//
//https://github.com/pzearfoss/NSNumber-RomanNumerals

#import <Foundation/Foundation.h>

///罗马数字
@interface NSNumber (GTRomanNumerals)

/**
 *  @author JKCategories
 *
 *   A category on NSNumber that returns the value as a roman numeral
 *
 *  @return return value description
 */
- (NSString *)gt_romanNumeral;

@end
