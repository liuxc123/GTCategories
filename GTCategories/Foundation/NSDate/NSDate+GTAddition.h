//
//  NSDate+GTAddition.h
//  FBSnapshotTestCase
//
//  Created by liuxc on 2018/11/16.
//
//
// https://github.com/erica/NSDate-Extensions

#import <Foundation/Foundation.h>
#define GT_D_MINUTE    60
#define GT_D_HOUR    3600
#define GT_D_DAY    86400
#define GT_D_WEEK    604800
#define GT_D_YEAR    31556926

@interface NSDate (GTAddition)

+ (NSCalendar *)gt_currentCalendar; // avoid bottlenecks

#pragma mark ---- Decomposing dates 分解的日期
@property (readonly) NSInteger gt_nearestHour;
@property (readonly) NSInteger gt_hour;
@property (readonly) NSInteger gt_minute;
@property (readonly) NSInteger gt_seconds;
@property (readonly) NSInteger gt_day;
@property (readonly) NSInteger gt_month;
@property (readonly) NSInteger gt_week;
@property (readonly) NSInteger gt_weekday;
@property (readonly) NSInteger gt_nthWeekday; // e.g. 2nd Tuesday of the month == 2
@property (readonly) NSInteger gt_year;

#pragma mark ----short time 格式化的时间
@property (nonatomic, readonly) NSString *gt_shortString;
@property (nonatomic, readonly) NSString *gt_shortDateString;
@property (nonatomic, readonly) NSString *gt_shortTimeString;
@property (nonatomic, readonly) NSString *gt_mediumString;
@property (nonatomic, readonly) NSString *gt_mediumDateString;
@property (nonatomic, readonly) NSString *gt_mediumTimeString;
@property (nonatomic, readonly) NSString *gt_longString;
@property (nonatomic, readonly) NSString *gt_longDateString;
@property (nonatomic, readonly) NSString *gt_longTimeString;

///使用dateStyle timeStyle格式化时间
- (NSString *)gt_stringWithDateStyle:(NSDateFormatterStyle)dateStyle timeStyle:(NSDateFormatterStyle)timeStyle;
///给定format格式化时间
- (NSString *)gt_stringWithFormat:(NSString *)format;

#pragma mark ---- 从当前日期相对日期时间
///明天
+ (NSDate *)gt_dateTomorrow;
///昨天
+ (NSDate *)gt_dateYesterday;
///今天后几天
+ (NSDate *)gt_dateWithDaysFromNow:(NSInteger)days;
///今天前几天
+ (NSDate *)gt_dateWithDaysBeforeNow:(NSInteger)days;
///当前小时后dHours个小时
+ (NSDate *)gt_dateWithHoursFromNow:(NSInteger)dHours;
///当前小时前dHours个小时
+ (NSDate *)gt_dateWithHoursBeforeNow:(NSInteger)dHours;
///当前分钟后dMinutes个分钟
+ (NSDate *)gt_dateWithMinutesFromNow:(NSInteger)dMinutes;
///当前分钟前dMinutes个分钟
+ (NSDate *)gt_dateWithMinutesBeforeNow:(NSInteger)dMinutes;


#pragma mark ---- Comparing dates 比较时间
///比较年月日是否相等
- (BOOL)gt_isEqualToDateIgnoringTime:(NSDate *)aDate;
///是否是今天
- (BOOL)gt_isToday;
///是否是明天
- (BOOL)gt_isTomorrow;
///是否是昨天
- (BOOL)gt_isYesterday;

///是否是同一周
- (BOOL)gt_isSameWeekAsDate:(NSDate *)aDate;
///是否是本周
- (BOOL)gt_isThisWeek;
///是否是本周的下周
- (BOOL)gt_isNextWeek;
///是否是本周的上周
- (BOOL)gt_isLastWeek;

///是否是同一月
- (BOOL)gt_isSameMonthAsDate:(NSDate *)aDate;
///是否是本月
- (BOOL)gt_isThisMonth;
///是否是本月的下月
- (BOOL)gt_isNextMonth;
///是否是本月的上月
- (BOOL)gt_isLastMonth;

///是否是同一年
- (BOOL)gt_isSameYearAsDate:(NSDate *)aDate;
///是否是今年
- (BOOL)gt_isThisYear;
///是否是今年的下一年
- (BOOL)gt_isNextYear;
///是否是今年的上一年
- (BOOL)gt_isLastYear;

///是否提前aDate
- (BOOL)gt_isEarlierThanDate:(NSDate *)aDate;
///是否晚于aDate
- (BOOL)gt_isLaterThanDate:(NSDate *)aDate;
///是否晚是未来
- (BOOL)gt_isInFuture;
///是否晚是过去
- (BOOL)gt_isInPast;


///是否是工作日
- (BOOL)gt_isTypicallyWorkday;
///是否是周末
- (BOOL)gt_isTypicallyWeekend;

#pragma mark ---- Adjusting dates 调节时间
///增加dYears年
- (NSDate *)gt_dateByAddingYears:(NSInteger)dYears;
///减少dYears年
- (NSDate *)gt_dateBySubtractingYears:(NSInteger)dYears;
///增加dMonths月
- (NSDate *)gt_dateByAddingMonths:(NSInteger)dMonths;
///减少dMonths月
- (NSDate *)gt_dateBySubtractingMonths:(NSInteger)dMonths;
///增加dDays天
- (NSDate *)gt_dateByAddingDays:(NSInteger)dDays;
///减少dDays天
- (NSDate *)gt_dateBySubtractingDays:(NSInteger)dDays;
///增加dHours小时
- (NSDate *)gt_dateByAddingHours:(NSInteger)dHours;
///减少dHours小时
- (NSDate *)gt_dateBySubtractingHours:(NSInteger)dHours;
///增加dMinutes分钟
- (NSDate *)gt_dateByAddingMinutes:(NSInteger)dMinutes;
///减少dMinutes分钟
- (NSDate *)gt_dateBySubtractingMinutes:(NSInteger)dMinutes;


#pragma mark ---- 时间间隔
///比aDate晚多少分钟
- (NSInteger)gt_minutesAfterDate:(NSDate *)aDate;
///比aDate早多少分钟
- (NSInteger)gt_minutesBeforeDate:(NSDate *)aDate;
///比aDate晚多少小时
- (NSInteger)gt_hoursAfterDate:(NSDate *)aDate;
///比aDate早多少小时
- (NSInteger)gt_hoursBeforeDate:(NSDate *)aDate;
///比aDate晚多少天
- (NSInteger)gt_daysAfterDate:(NSDate *)aDate;
///比aDate早多少天
- (NSInteger)gt_daysBeforeDate:(NSDate *)aDate;

///与anotherDate间隔几天
- (NSInteger)gt_distanceDaysToDate:(NSDate *)anotherDate;
///与anotherDate间隔几月
- (NSInteger)gt_distanceMonthsToDate:(NSDate *)anotherDate;
///与anotherDate间隔几年
- (NSInteger)gt_distanceYearsToDate:(NSDate *)anotherDate;

@end
