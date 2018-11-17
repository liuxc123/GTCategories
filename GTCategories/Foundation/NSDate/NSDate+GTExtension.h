//
//  NSDate+GTExtension.h
//  GTCategories
//
//  Created by liuxc on 2018/11/16.
//

#import <Foundation/Foundation.h>

@interface NSDate (GTExtension)


/**
 * 获取日、月、年、小时、分钟、秒
 */
- (NSUInteger)gt_day;
- (NSUInteger)gt_month;
- (NSUInteger)gt_year;
- (NSUInteger)gt_hour;
- (NSUInteger)gt_minute;
- (NSUInteger)gt_second;
+ (NSUInteger)gt_day:(NSDate *)date;
+ (NSUInteger)gt_month:(NSDate *)date;
+ (NSUInteger)gt_year:(NSDate *)date;
+ (NSUInteger)gt_hour:(NSDate *)date;
+ (NSUInteger)gt_minute:(NSDate *)date;
+ (NSUInteger)gt_second:(NSDate *)date;

/**
 * 获取一年中的总天数
 */
- (NSUInteger)gt_daysInYear;
+ (NSUInteger)gt_daysInYear:(NSDate *)date;

/**
 * 判断是否是润年
 * @return YES表示润年，NO表示平年
 */
- (BOOL)gt_isLeapYear;
+ (BOOL)gt_isLeapYear:(NSDate *)date;

/**
 * 获取该日期是该年的第几周
 */
- (NSUInteger)gt_weekOfYear;
+ (NSUInteger)gt_weekOfYear:(NSDate *)date;

/**
 * 获取格式化为YYYY-MM-dd格式的日期字符串
 */
- (NSString *)gt_formatYMD;
+ (NSString *)gt_formatYMD:(NSDate *)date;

/**
 * 返回当前月一共有几周(可能为4,5,6)
 */
- (NSUInteger)gt_weeksOfMonth;
+ (NSUInteger)gt_weeksOfMonth:(NSDate *)date;

/**
 * 获取该月的第一天的日期
 */
- (NSDate *)gt_begindayOfMonth;
+ (NSDate *)gt_begindayOfMonth:(NSDate *)date;

/**
 * 获取该月的最后一天的日期
 */
- (NSDate *)gt_lastdayOfMonth;
+ (NSDate *)gt_lastdayOfMonth:(NSDate *)date;

/**
 * 返回day天后的日期(若day为负数,则为|day|天前的日期)
 */
- (NSDate *)gt_dateAfterDay:(NSUInteger)day;
+ (NSDate *)gt_dateAfterDate:(NSDate *)date day:(NSInteger)day;

/**
 * 返回day天后的日期(若day为负数,则为|day|天前的日期)
 */
- (NSDate *)gt_dateAfterMonth:(NSUInteger)month;
+ (NSDate *)gt_dateAfterDate:(NSDate *)date month:(NSInteger)month;

/**
 * 返回numYears年后的日期
 */
- (NSDate *)gt_offsetYears:(int)numYears;
+ (NSDate *)gt_offsetYears:(int)numYears fromDate:(NSDate *)fromDate;

/**
 * 返回numMonths月后的日期
 */
- (NSDate *)gt_offsetMonths:(int)numMonths;
+ (NSDate *)gt_offsetMonths:(int)numMonths fromDate:(NSDate *)fromDate;

/**
 * 返回numDays天后的日期
 */
- (NSDate *)gt_offsetDays:(int)numDays;
+ (NSDate *)gt_offsetDays:(int)numDays fromDate:(NSDate *)fromDate;

/**
 * 返回numHours小时后的日期
 */
- (NSDate *)gt_offsetHours:(int)hours;
+ (NSDate *)gt_offsetHours:(int)numHours fromDate:(NSDate *)fromDate;

/**
 * 距离该日期前几天
 */
- (NSUInteger)gt_daysAgo;
+ (NSUInteger)gt_daysAgo:(NSDate *)date;

/**
 *  获取星期几
 *
 *  @return Return weekday number
 *  [1 - Sunday]
 *  [2 - Monday]
 *  [3 - Tuerday]
 *  [4 - Wednesday]
 *  [5 - Thursday]
 *  [6 - Friday]
 *  [7 - Saturday]
 */
- (NSInteger)gt_weekday;
+ (NSInteger)gt_weekday:(NSDate *)date;

/**
 *  获取星期几(名称)
 *
 *  @return Return weekday as a localized string
 *  [1 - Sunday]
 *  [2 - Monday]
 *  [3 - Tuerday]
 *  [4 - Wednesday]
 *  [5 - Thursday]
 *  [6 - Friday]
 *  [7 - Saturday]
 */
- (NSString *)gt_dayFromWeekday;
+ (NSString *)gt_dayFromWeekday:(NSDate *)date;

/**
 *  日期是否相等
 *
 *  @param anotherDate The another date to compare as NSDate
 *  @return Return YES if is same day, NO if not
 */
- (BOOL)gt_isSameDay:(NSDate *)anotherDate;

/**
 *  是否是今天
 *
 *  @return Return if self is today
 */
- (BOOL)gt_isToday;

/**
 *  Add days to self
 *
 *  @param days The number of days to add
 *  @return Return self by adding the gived days number
 */
- (NSDate *)gt_dateByAddingDays:(NSUInteger)days;

/**
 *  Get the month as a localized string from the given month number
 *
 *  @param month The month to be converted in string
 *  [1 - January]
 *  [2 - February]
 *  [3 - March]
 *  [4 - April]
 *  [5 - May]
 *  [6 - June]
 *  [7 - July]
 *  [8 - August]
 *  [9 - September]
 *  [10 - October]
 *  [11 - November]
 *  [12 - December]
 *
 *  @return Return the given month as a localized string
 */
+ (NSString *)gt_monthWithMonthNumber:(NSInteger)month;

/**
 * 根据日期返回字符串
 */
+ (NSString *)gt_stringWithDate:(NSDate *)date format:(NSString *)format;
- (NSString *)gt_stringWithFormat:(NSString *)format;
+ (NSDate *)gt_dateWithString:(NSString *)string format:(NSString *)format;

/**
 * 获取指定月份的天数
 */
- (NSUInteger)gt_daysInMonth:(NSUInteger)month;
+ (NSUInteger)gt_daysInMonth:(NSDate *)date month:(NSUInteger)month;

/**
 * 获取当前月份的天数
 */
- (NSUInteger)gt_daysInMonth;
+ (NSUInteger)gt_daysInMonth:(NSDate *)date;

/**
 * 返回x分钟前/x小时前/昨天/x天前/x个月前/x年前
 */
- (NSString *)gt_timeInfo;
+ (NSString *)gt_timeInfoWithDate:(NSDate *)date;
+ (NSString *)gt_timeInfoWithDateString:(NSString *)dateString;

/**
 * 分别获取yyyy-MM-dd/HH:mm:ss/yyyy-MM-dd HH:mm:ss格式的字符串
 */
- (NSString *)gt_ymdFormat;
- (NSString *)gt_hmsFormat;
- (NSString *)gt_ymdHmsFormat;
+ (NSString *)gt_ymdFormat;
+ (NSString *)gt_hmsFormat;
+ (NSString *)gt_ymdHmsFormat;


@end
