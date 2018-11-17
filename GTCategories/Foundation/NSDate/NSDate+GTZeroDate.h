//
//  NSDate+GTZeroDate.h
//  GTCategories
//
//  Created by liuxc on 2018/11/16.
//

#import <Foundation/Foundation.h>

@interface NSDate (GTZeroDate)

+ (NSDate *)gt_zeroTodayDate;
+ (NSDate *)gt_zero24TodayDate;

- (NSDate *)gt_zeroDate;
- (NSDate *)gt_zero24Date;

@end
