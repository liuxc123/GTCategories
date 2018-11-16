//
//  NSDecimalNumber+GTCalculatingByString.h
//  FBSnapshotTestCase
//
//  Created by liuxc on 2018/11/16.
//
//https://github.com/adi-li/NSDecimalNumber-StringCalculation

#import <Foundation/Foundation.h>

@interface NSNumber (GTCalculatingByString)

/**
 *  @author JKCategories
 *
 *   use string calculation for nsdecimalnumber, for simplicity when doing much calculation works.
 *
 *  @param equation <#equation description#>
 *  @param numbers  <#numbers description#>
 *
 *  @return <#return value description#>
 */
+ (NSDecimalNumber *)gt_decimalNumberWithEquation:(NSString *)equation decimalNumbers:(NSDictionary *)numbers;

@end
