//
//  NSDate+GTLunarCalendar.h
//  FBSnapshotTestCase
//
//  Created by liuxc on 2018/11/16.
//

#import <Foundation/Foundation.h>

///农历大写日期
@interface NSDate (GTLunarCalendar)

+ (NSCalendar *)gt_chineseCalendar;
//例如 五月初一
+ (NSString*)gt_currentMDDateString;
//例如 乙未年五月初一
+ (NSString*)gt_currentYMDDateString;
//例如 星期一
+ (NSString *)gt_currentWeek:(NSDate*)date;
//例如 星期一
+ (NSString *)gt_currentWeekWithDateString:(NSString*)datestring;
//例如 五月一
+ (NSString*)gt_currentCapitalDateString;

@end
