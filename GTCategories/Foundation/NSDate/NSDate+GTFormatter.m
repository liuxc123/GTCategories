//
//  NSDate+GTFormatter.m
//  GTCategories
//
//  Created by liuxc on 2018/11/16.
//

#import "NSDate+GTFormatter.h"

@implementation NSDate (GTFormatter)

+(NSDateFormatter *)gt_formatter {

    static NSDateFormatter *formatter = nil;
    static dispatch_once_t oncePredicate;

    dispatch_once(&oncePredicate, ^{
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateStyle:NSDateFormatterMediumStyle];
        [formatter setTimeStyle:NSDateFormatterShortStyle];
        [formatter setDoesRelativeDateFormatting:YES];
    });

    return formatter;
}

+(NSDateFormatter *)gt_formatterWithoutTime {

    static NSDateFormatter *formatterWithoutTime = nil;
    static dispatch_once_t oncePredicate;

    dispatch_once(&oncePredicate, ^{
        formatterWithoutTime = [[NSDate gt_formatter] copy];
        [formatterWithoutTime setTimeStyle:NSDateFormatterNoStyle];
    });

    return formatterWithoutTime;
}

+(NSDateFormatter *)gt_formatterWithoutDate {

    static NSDateFormatter *formatterWithoutDate = nil;
    static dispatch_once_t oncePredicate;

    dispatch_once(&oncePredicate, ^{
        formatterWithoutDate = [[NSDate gt_formatter] copy];
        [formatterWithoutDate setDateStyle:NSDateFormatterNoStyle];
    });

    return formatterWithoutDate;
}

#pragma mark -
#pragma mark Formatter with date & time
-(NSString *)gt_formatWithUTCTimeZone {
    return [self gt_formatWithTimeZoneOffset:0];
}

-(NSString *)gt_formatWithLocalTimeZone {
    return [self gt_formatWithTimeZone:[NSTimeZone localTimeZone]];
}

-(NSString *)gt_formatWithTimeZoneOffset:(NSTimeInterval)offset {
    return [self gt_formatWithTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:offset]];
}

-(NSString *)gt_formatWithTimeZone:(NSTimeZone *)timezone {
    NSDateFormatter *formatter = [NSDate gt_formatter];
    [formatter setTimeZone:timezone];
    return [formatter stringFromDate:self];
}

#pragma mark -
#pragma mark Formatter without time
-(NSString *)gt_formatWithUTCTimeZoneWithoutTime {
    return [self gt_formatWithTimeZoneOffsetWithoutTime:0];
}

-(NSString *)gt_formatWithLocalTimeZoneWithoutTime {
    return [self gt_formatWithTimeZoneWithoutTime:[NSTimeZone localTimeZone]];
}

-(NSString *)gt_formatWithTimeZoneOffsetWithoutTime:(NSTimeInterval)offset {
    return [self gt_formatWithTimeZoneWithoutTime:[NSTimeZone timeZoneForSecondsFromGMT:offset]];
}

-(NSString *)gt_formatWithTimeZoneWithoutTime:(NSTimeZone *)timezone {
    NSDateFormatter *formatter = [NSDate gt_formatterWithoutTime];
    [formatter setTimeZone:timezone];
    return [formatter stringFromDate:self];
}

#pragma mark -
#pragma mark Formatter without date
-(NSString *)gt_formatWithUTCWithoutDate {
    return [self gt_formatTimeWithTimeZone:0];
}
-(NSString *)gt_formatWithLocalTimeWithoutDate {
    return [self gt_formatTimeWithTimeZone:[NSTimeZone localTimeZone]];
}

-(NSString *)gt_formatWithTimeZoneOffsetWithoutDate:(NSTimeInterval)offset {
    return [self gt_formatTimeWithTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:offset]];
}

-(NSString *)gt_formatTimeWithTimeZone:(NSTimeZone *)timezone {
    NSDateFormatter *formatter = [NSDate gt_formatterWithoutDate];
    [formatter setTimeZone:timezone];
    return [formatter stringFromDate:self];
}
#pragma mark -
#pragma mark Formatter  date
+ (NSString *)gt_currentDateStringWithFormat:(NSString *)format
{
    NSDate *chosenDate = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    NSString *date = [formatter stringFromDate:chosenDate];
    return date;
}
+ (NSDate *)gt_dateWithSecondsFromNow:(NSInteger)seconds {
    NSDate *date = [NSDate date];
    NSDateComponents *components = [NSDateComponents new];
    [components setSecond:seconds];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDate *dateSecondsAgo = [calendar dateByAddingComponents:components toDate:date options:0];
    return dateSecondsAgo;
}

+ (NSDate *)gt_dateWithYear:(NSInteger)year month:(NSUInteger)month day:(NSUInteger)day {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setYear:year];
    [components setMonth:month];
    [components setDay:day];
    return [calendar dateFromComponents:components];
}
- (NSString *)gt_dateWithFormat:(NSString *)format
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    NSString *date = [formatter stringFromDate:self];
    return date;
}

@end
