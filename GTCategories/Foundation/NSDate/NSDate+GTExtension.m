//
//  NSDate+GTExtension.m
//  FBSnapshotTestCase
//
//  Created by liuxc on 2018/11/16.
//

#import "NSDate+GTExtension.h"

@implementation NSDate (GTExtension)


- (NSUInteger)gt_day {
    return [NSDate gt_day:self];
}

- (NSUInteger)gt_month {
    return [NSDate gt_month:self];
}

- (NSUInteger)gt_year {
    return [NSDate gt_year:self];
}

- (NSUInteger)gt_hour {
    return [NSDate gt_hour:self];
}

- (NSUInteger)gt_minute {
    return [NSDate gt_minute:self];
}

- (NSUInteger)gt_second {
    return [NSDate gt_second:self];
}

+ (NSUInteger)gt_day:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];

#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitDay) fromDate:date];
#else
    NSDateComponents *dayComponents = [calendar components:(NSDayCalendarUnit) fromDate:date];
#endif

    return [dayComponents day];
}

+ (NSUInteger)gt_month:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];

#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitMonth) fromDate:date];
#else
    NSDateComponents *dayComponents = [calendar components:(NSMonthCalendarUnit) fromDate:date];
#endif

    return [dayComponents month];
}

+ (NSUInteger)gt_year:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];

#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitYear) fromDate:date];
#else
    NSDateComponents *dayComponents = [calendar components:(NSYearCalendarUnit) fromDate:date];
#endif

    return [dayComponents year];
}

+ (NSUInteger)gt_hour:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];

#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitHour) fromDate:date];
#else
    NSDateComponents *dayComponents = [calendar components:(NSHourCalendarUnit) fromDate:date];
#endif

    return [dayComponents hour];
}

+ (NSUInteger)gt_minute:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];

#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitMinute) fromDate:date];
#else
    NSDateComponents *dayComponents = [calendar components:(NSMinuteCalendarUnit) fromDate:date];
#endif

    return [dayComponents minute];
}

+ (NSUInteger)gt_second:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];

#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitSecond) fromDate:date];
#else
    NSDateComponents *dayComponents = [calendar components:(NSSecondCalendarUnit) fromDate:date];
#endif

    return [dayComponents second];
}

- (NSUInteger)gt_daysInYear {
    return [NSDate gt_daysInYear:self];
}

+ (NSUInteger)gt_daysInYear:(NSDate *)date {
    return [self gt_isLeapYear:date] ? 366 : 365;
}

- (BOOL)gt_isLeapYear {
    return [NSDate gt_isLeapYear:self];
}

+ (BOOL)gt_isLeapYear:(NSDate *)date {
    NSUInteger year = [date gt_year];
    if ((year % 4  == 0 && year % 100 != 0) || year % 400 == 0) {
        return YES;
    }
    return NO;
}

- (NSString *)gt_formatYMD {
    return [NSDate gt_formatYMD:self];
}

+ (NSString *)gt_formatYMD:(NSDate *)date {
    return [NSString stringWithFormat:@"%zd-%zd-%zd",[date gt_year],[date gt_month], [date gt_day]];
}

- (NSUInteger)gt_weeksOfMonth {
    return [NSDate gt_weeksOfMonth:self];
}

+ (NSUInteger)gt_weeksOfMonth:(NSDate *)date {
    return [[date gt_lastdayOfMonth] gt_weekOfYear] - [[date gt_begindayOfMonth] gt_weekOfYear] + 1;
}

- (NSUInteger)gt_weekOfYear {
    return [NSDate gt_weekOfYear:self];
}

+ (NSUInteger)gt_weekOfYear:(NSDate *)date {
    NSUInteger i;
    NSUInteger year = [date gt_year];

    //    NSDate *lastdate = [date gt_lastdayOfMonth];

    for (i = 1;[[date gt_dateAfterDay:-7 * i] gt_year] == year; i++) {

    }
    //    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    //    [dateFormatter setDateFormat:@"'公元前/后:'G  '年份:'u'='yyyy'='yy '季度:'q'='qqq'='qqqq '月份:'M'='MMM'='MMMM '今天是今年第几周:'w '今天是本月第几周:'W  '今天是今天第几天:'D '今天是本月第几天:'d '星期:'c'='ccc'='cccc '上午/下午:'a '小时:'h'='H '分钟:'m '秒:'s '毫秒:'SSS  '这一天已过多少毫秒:'A  '时区名称:'zzzz'='vvvv '时区编号:'Z "];
    //    NSLog(@"%@", [dateFormatter stringFromDate:[NSDate date]]);
    return i;
}

- (NSDate *)gt_dateAfterDay:(NSUInteger)day {
    return [NSDate gt_dateAfterDate:self day:day];
}

+ (NSDate *)gt_dateAfterDate:(NSDate *)date day:(NSInteger)day {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *componentsToAdd = [[NSDateComponents alloc] init];
    [componentsToAdd setDay:day];

    NSDate *dateAfterDay = [calendar dateByAddingComponents:componentsToAdd toDate:date options:0];

    return dateAfterDay;
}

- (NSDate *)gt_dateAfterMonth:(NSUInteger)month {
    return [NSDate gt_dateAfterDate:self month:month];
}

+ (NSDate *)gt_dateAfterDate:(NSDate *)date month:(NSInteger)month {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *componentsToAdd = [[NSDateComponents alloc] init];
    [componentsToAdd setMonth:month];
    NSDate *dateAfterMonth = [calendar dateByAddingComponents:componentsToAdd toDate:date options:0];

    return dateAfterMonth;
}

- (NSDate *)gt_begindayOfMonth {
    return [NSDate gt_begindayOfMonth:self];
}

+ (NSDate *)gt_begindayOfMonth:(NSDate *)date {
    return [self gt_dateAfterDate:date day:-[date gt_day] + 1];
}

- (NSDate *)gt_lastdayOfMonth {
    return [NSDate gt_lastdayOfMonth:self];
}

+ (NSDate *)gt_lastdayOfMonth:(NSDate *)date {
    NSDate *lastDate = [self gt_begindayOfMonth:date];
    return [[lastDate gt_dateAfterMonth:1] gt_dateAfterDay:-1];
}

- (NSUInteger)gt_daysAgo {
    return [NSDate gt_daysAgo:self];
}

+ (NSUInteger)gt_daysAgo:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];

#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    NSDateComponents *components = [calendar components:(NSCalendarUnitDay)
                                               fromDate:date
                                                 toDate:[NSDate date]
                                                options:0];
#else
    NSDateComponents *components = [calendar components:(NSDayCalendarUnit)
                                               fromDate:date
                                                 toDate:[NSDate date]
                                                options:0];
#endif

    return [components day];
}

- (NSInteger)gt_weekday {
    return [NSDate gt_weekday:self];
}

+ (NSInteger)gt_weekday:(NSDate *)date {
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = [gregorian components:(NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear | NSCalendarUnitWeekday) fromDate:date];
    NSInteger weekday = [comps weekday];

    return weekday;
}

- (NSString *)gt_dayFromWeekday {
    return [NSDate gt_dayFromWeekday:self];
}

+ (NSString *)gt_dayFromWeekday:(NSDate *)date {
    switch([date gt_weekday]) {
        case 1:
            return @"星期天";
            break;
        case 2:
            return @"星期一";
            break;
        case 3:
            return @"星期二";
            break;
        case 4:
            return @"星期三";
            break;
        case 5:
            return @"星期四";
            break;
        case 6:
            return @"星期五";
            break;
        case 7:
            return @"星期六";
            break;
        default:
            break;
    }
    return @"";
}

- (BOOL)gt_isSameDay:(NSDate *)anotherDate {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components1 = [calendar components:(NSCalendarUnitYear
                                                          | NSCalendarUnitMonth
                                                          | NSCalendarUnitDay)
                                                fromDate:self];
    NSDateComponents *components2 = [calendar components:(NSCalendarUnitYear
                                                          | NSCalendarUnitMonth
                                                          | NSCalendarUnitDay)
                                                fromDate:anotherDate];
    return ([components1 year] == [components2 year]
            && [components1 month] == [components2 month]
            && [components1 day] == [components2 day]);
}

- (BOOL)gt_isToday {
    return [self gt_isSameDay:[NSDate date]];
}

- (NSDate *)gt_dateByAddingDays:(NSUInteger)days {
    NSDateComponents *c = [[NSDateComponents alloc] init];
    c.day = days;
    return [[NSCalendar currentCalendar] dateByAddingComponents:c toDate:self options:0];
}

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
+ (NSString *)gt_monthWithMonthNumber:(NSInteger)month {
    switch(month) {
        case 1:
            return @"January";
            break;
        case 2:
            return @"February";
            break;
        case 3:
            return @"March";
            break;
        case 4:
            return @"April";
            break;
        case 5:
            return @"May";
            break;
        case 6:
            return @"June";
            break;
        case 7:
            return @"July";
            break;
        case 8:
            return @"August";
            break;
        case 9:
            return @"September";
            break;
        case 10:
            return @"October";
            break;
        case 11:
            return @"November";
            break;
        case 12:
            return @"December";
            break;
        default:
            break;
    }
    return @"";
}

+ (NSString *)gt_stringWithDate:(NSDate *)date format:(NSString *)format {
    return [date gt_stringWithFormat:format];
}

- (NSString *)gt_stringWithFormat:(NSString *)format {
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    [outputFormatter setDateFormat:format];

    NSString *retStr = [outputFormatter stringFromDate:self];

    return retStr;
}

+ (NSDate *)gt_dateWithString:(NSString *)string format:(NSString *)format {
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    [inputFormatter setDateFormat:format];

    NSDate *date = [inputFormatter dateFromString:string];

    return date;
}

- (NSUInteger)gt_daysInMonth:(NSUInteger)month {
    return [NSDate gt_daysInMonth:self month:month];
}

+ (NSUInteger)gt_daysInMonth:(NSDate *)date month:(NSUInteger)month {
    switch (month) {
        case 1: case 3: case 5: case 7: case 8: case 10: case 12:
            return 31;
        case 2:
            return [date gt_isLeapYear] ? 29 : 28;
    }
    return 30;
}

- (NSUInteger)gt_daysInMonth {
    return [NSDate gt_daysInMonth:self];
}

+ (NSUInteger)gt_daysInMonth:(NSDate *)date {
    return [self gt_daysInMonth:date month:[date gt_month]];
}

- (NSString *)gt_timeInfo {
    return [NSDate gt_timeInfoWithDate:self];
}

+ (NSString *)gt_timeInfoWithDate:(NSDate *)date {
    return [self gt_timeInfoWithDateString:[self gt_stringWithDate:date format:[self gt_ymdHmsFormat]]];
}

+ (NSString *)gt_timeInfoWithDateString:(NSString *)dateString {
    NSDate *date = [self gt_dateWithString:dateString format:[self gt_ymdHmsFormat]];

    NSDate *curDate = [NSDate date];
    NSTimeInterval time = -[date timeIntervalSinceDate:curDate];

    int month = (int)([curDate gt_month] - [date gt_month]);
    int year = (int)([curDate gt_year] - [date gt_year]);
    int day = (int)([curDate gt_day] - [date gt_day]);

    NSTimeInterval retTime = 1.0;
    if (time < 3600) { // 小于一小时
        retTime = time / 60;
        retTime = retTime <= 0.0 ? 1.0 : retTime;
        //        return [NSString stringWithFormat:@"%.0f分钟前", retTime];
        return retTime < 1.0 ? @"刚刚" : [NSString stringWithFormat:@"%.0f分钟前", retTime];

    } else if (time < 3600 * 24) { // 小于一天，也就是今天
        retTime = time / 3600;
        retTime = retTime <= 0.0 ? 1.0 : retTime;
        return [NSString stringWithFormat:@"%.0f小时前", retTime];
    } else if (time < 3600 * 24 * 2) {
        return @"昨天";
    }
    // 第一个条件是同年，且相隔时间在一个月内
    // 第二个条件是隔年，对于隔年，只能是去年12月与今年1月这种情况
    else if ((abs(year) == 0 && abs(month) <= 1)
             || (abs(year) == 1 && [curDate gt_month] == 1 && [date gt_month] == 12)) {
        int retDay = 0;
        if (year == 0) { // 同年
            if (month == 0) { // 同月
                retDay = day;
            }
        }

        if (retDay <= 0) {
            // 获取发布日期中，该月有多少天
            int totalDays = (int)[self gt_daysInMonth:date month:[date gt_month]];

            // 当前天数 + （发布日期月中的总天数-发布日期月中发布日，即等于距离今天的天数）
            retDay = (int)[curDate gt_day] + (totalDays - (int)[date gt_day]);
        }

        return [NSString stringWithFormat:@"%d天前", (abs)(retDay)];
    } else  {
        if (abs(year) <= 1) {
            if (year == 0) { // 同年
                return [NSString stringWithFormat:@"%d个月前", abs(month)];
            }

            // 隔年
            int month = (int)[curDate gt_month];
            int preMonth = (int)[date gt_month];
            if (month == 12 && preMonth == 12) {// 隔年，但同月，就作为满一年来计算
                return @"1年前";
            }
            return [NSString stringWithFormat:@"%d个月前", (abs)(12 - preMonth + month)];
        }

        return [NSString stringWithFormat:@"%d年前", abs(year)];
    }

    return @"1小时前";
}

- (NSString *)gt_ymdFormat {
    return [NSDate gt_ymdFormat];
}

- (NSString *)gt_hmsFormat {
    return [NSDate gt_hmsFormat];
}

- (NSString *)gt_ymdHmsFormat {
    return [NSDate gt_ymdHmsFormat];
}

+ (NSString *)gt_ymdFormat {
    return @"yyyy-MM-dd";
}

+ (NSString *)gt_hmsFormat {
    return @"HH:mm:ss";
}

+ (NSString *)gt_ymdHmsFormat {
    return [NSString stringWithFormat:@"%@ %@", [self gt_ymdFormat], [self gt_hmsFormat]];
}

- (NSDate *)gt_offsetYears:(int)numYears {
    return [NSDate gt_offsetYears:numYears fromDate:self];
}

+ (NSDate *)gt_offsetYears:(int)numYears fromDate:(NSDate *)fromDate {
    if (fromDate == nil) {
        return nil;
    }

#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
#else
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
#endif


    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setYear:numYears];

    return [gregorian dateByAddingComponents:offsetComponents
                                      toDate:fromDate
                                     options:0];
}

- (NSDate *)gt_offsetMonths:(int)numMonths {
    return [NSDate gt_offsetMonths:numMonths fromDate:self];
}

+ (NSDate *)gt_offsetMonths:(int)numMonths fromDate:(NSDate *)fromDate {
    if (fromDate == nil) {
        return nil;
    }

#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
#else
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
#endif


    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setMonth:numMonths];

    return [gregorian dateByAddingComponents:offsetComponents
                                      toDate:fromDate
                                     options:0];
}

- (NSDate *)gt_offsetDays:(int)numDays {
    return [NSDate gt_offsetDays:numDays fromDate:self];
}

+ (NSDate *)gt_offsetDays:(int)numDays fromDate:(NSDate *)fromDate {
    if (fromDate == nil) {
        return nil;
    }

#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
#else
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
#endif


    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setDay:numDays];

    return [gregorian dateByAddingComponents:offsetComponents
                                      toDate:fromDate
                                     options:0];
}

- (NSDate *)gt_offsetHours:(int)hours {
    return [NSDate gt_offsetHours:hours fromDate:self];
}

+ (NSDate *)gt_offsetHours:(int)numHours fromDate:(NSDate *)fromDate {
    if (fromDate == nil) {
        return nil;
    }

#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
#else
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
#endif


    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setHour:numHours];

    return [gregorian dateByAddingComponents:offsetComponents
                                      toDate:fromDate
                                     options:0];
}

@end
