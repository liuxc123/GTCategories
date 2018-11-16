//
//  NSDate+GTReporting.m
//  FBSnapshotTestCase
//
//  Created by liuxc on 2018/11/16.
//

#import "NSDate+GTReporting.h"

// Private Helper functions
@interface NSDate (Private)

+ (void)gt_zeroOutTimeComponents:(NSDateComponents **)components;
+ (NSDate *)gt_firstDayOfQuarterFromDate:(NSDate *)date;

@end

@implementation NSDate (GTReporting)

+(NSCalendar*)gt_gregorianCalendar_factory{
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_8_0
    NSCalendar *gregorianCalendar;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0f){
        gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    }else{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
#pragma clang diagnostic pop
    }
#else
    NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
#endif

    return gregorianCalendar;
}
+(NSDateComponents*)gt_YMDComponentsFactor:(NSDate*)date withGregorianCalendar:(NSCalendar*)gregorianCalendar{

    //    NSCalendar *gregorianCalendar = [[self class] gt_gregorianCalendar_factory];

#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_8_0
    NSDateComponents *components;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0f){
        components = [gregorianCalendar components: NSCalendarUnitMonth | NSCalendarUnitDay |NSCalendarUnitYear fromDate:date];
        return components;
    }else{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        components = [gregorianCalendar components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit fromDate:date];
        return components;
#pragma clang diagnostic pop
    }
#else
    NSDateComponents *components = [gregorianCalendar components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit fromDate:date];
    return components;
#endif
}


+ (NSDate *)gt_dateWithYear:(int)year month:(int)month day:(int)day {
    NSDateComponents *components = [[NSDateComponents alloc] init];

    // Assign the year, month and day components.
    [components setYear:year];
    [components setMonth:month];
    [components setDay:day];

    // Zero out the hour, minute and second components.
    [self gt_zeroOutTimeComponents:&components];

    // Generate a valid NSDate and return it.
    NSCalendar *gregorianCalendar = [[self class] gt_gregorianCalendar_factory];
    return [gregorianCalendar dateFromComponents:components];
}


+ (NSDate *)gt_midnightOfDate:(NSDate *)date {
    NSCalendar *gregorianCalendar = [[self class] gt_gregorianCalendar_factory];

    // Start out by getting just the year, month and day components of the specified date.
    NSDateComponents *components = [self gt_YMDComponentsFactor:date withGregorianCalendar:gregorianCalendar];
    // Zero out the hour, minute and second components.
    [self gt_zeroOutTimeComponents:&components];

    // Convert the components back into a date and return it.
    return [gregorianCalendar dateFromComponents:components];
}

+ (NSDate *)gt_midnightToday {
    return [self gt_midnightOfDate:[NSDate date]];
}

+ (NSDate *)gt_midnightTomorrow {
    NSDate *midnightToday = [self gt_midnightToday];
    return [self gt_oneDayAfter:midnightToday];
}

+ (NSDate *)gt_oneDayAfter:(NSDate *)date {
    NSDateComponents *oneDayComponent = [[NSDateComponents alloc] init];
    [oneDayComponent setDay:1];

    NSCalendar *gregorianCalendar = [[self class] gt_gregorianCalendar_factory];
    return [gregorianCalendar dateByAddingComponents:oneDayComponent
                                              toDate:date
                                             options:0];
}

+ (NSDate *)gt_firstDayOfCurrentMonth {
    NSCalendar *gregorianCalendar = [[self class] gt_gregorianCalendar_factory];

    // Start out by getting just the year, month and day components of the current date.
    NSDate *currentDate = [NSDate date];
    NSDateComponents *components = [self gt_YMDComponentsFactor:currentDate withGregorianCalendar:gregorianCalendar];

    // Change the Day component to 1 (for the first day of the month), and zero out the time components.
    [components setDay:1];
    [self gt_zeroOutTimeComponents:&components];

    return [gregorianCalendar dateFromComponents:components];
}

+ (NSDate *)gt_firstDayOfPreviousMonth {
    // Set up a "minus one month" component.
    NSDateComponents *minusOneMonthComponent = [[NSDateComponents alloc] init];
    [minusOneMonthComponent setMonth:-1];

    // Subtract 1 month from today's date. This gives us "one month ago today".
    NSCalendar *gregorianCalendar = [[self class] gt_gregorianCalendar_factory];
    NSDate *currentDate = [NSDate date];
    NSDate *oneMonthAgoToday = [gregorianCalendar dateByAddingComponents:minusOneMonthComponent
                                                                  toDate:currentDate
                                                                 options:0];

    // Now extract the year, month and day components of oneMonthAgoToday.
    NSDateComponents *components =[self gt_YMDComponentsFactor:oneMonthAgoToday withGregorianCalendar:gregorianCalendar];

    // Change the day to 1 (since we want the first day of the previous month).
    [components setDay:1];

    // Zero out the time components so we get midnight.
    [self gt_zeroOutTimeComponents:&components];

    // Finally, create a new NSDate from components and return it.
    return [gregorianCalendar dateFromComponents:components];
}

+ (NSDate *)gt_firstDayOfNextMonth {
    NSDate *firstDayOfCurrentMonth = [self gt_firstDayOfCurrentMonth];

    // Set up a "plus 1 month" component.
    NSDateComponents *plusOneMonthComponent = [[NSDateComponents alloc] init];
    [plusOneMonthComponent setMonth:1];

    // Add 1 month to firstDayOfCurrentMonth.
    NSCalendar *gregorianCalendar = [[self class] gt_gregorianCalendar_factory];
    return [gregorianCalendar dateByAddingComponents:plusOneMonthComponent
                                              toDate:firstDayOfCurrentMonth
                                             options:0];
}

+ (NSDate *)gt_firstDayOfCurrentQuarter {
    return [self gt_firstDayOfQuarterFromDate:[NSDate date]];
}

+ (NSDate *)gt_firstDayOfPreviousQuarter {
    NSDate *firstDayOfCurrentQuarter = [self gt_firstDayOfCurrentQuarter];

    // Set up a "minus one day" component.
    NSDateComponents *minusOneDayComponent = [[NSDateComponents alloc] init];
    [minusOneDayComponent setDay:-1];

    // Subtract 1 day from firstDayOfCurrentQuarter.
    NSCalendar *gregorianCalendar = [[self class] gt_gregorianCalendar_factory];
    NSDate *lastDayOfPreviousQuarter = [gregorianCalendar dateByAddingComponents:minusOneDayComponent
                                                                          toDate:firstDayOfCurrentQuarter
                                                                         options:0];
    return [self gt_firstDayOfQuarterFromDate:lastDayOfPreviousQuarter];
}

+ (NSDate *)gt_firstDayOfNextQuarter {
    NSDate *firstDayOfCurrentQuarter = [self gt_firstDayOfCurrentQuarter];

    // Set up a "plus 3 months" component.
    NSDateComponents *plusThreeMonthsComponent = [[NSDateComponents alloc] init];
    [plusThreeMonthsComponent setMonth:3];

    // Add 3 months to firstDayOfCurrentQuarter.
    NSCalendar *gregorianCalendar = [[self class] gt_gregorianCalendar_factory];
    return [gregorianCalendar dateByAddingComponents:plusThreeMonthsComponent
                                              toDate:firstDayOfCurrentQuarter
                                             options:0];
}

+ (NSDate *)gt_firstDayOfCurrentYear {
    NSCalendar *gregorianCalendar = [[self class] gt_gregorianCalendar_factory];

    // Start out by getting just the year, month and day components of the current date.
    NSDate *currentDate = [NSDate date];
    NSDateComponents *components =[self gt_YMDComponentsFactor:currentDate withGregorianCalendar:gregorianCalendar];

    // Change the Day and Month components to 1 (for the first day of the year), and zero out the time components.
    [components setDay:1];
    [components setMonth:1];
    [self gt_zeroOutTimeComponents:&components];

    return [gregorianCalendar dateFromComponents:components];
}

+ (NSDate *)gt_firstDayOfPreviousYear {
    NSCalendar *gregorianCalendar = [[self class] gt_gregorianCalendar_factory];
    NSDate *currentDate = [NSDate date];
    NSDateComponents *components = [self gt_YMDComponentsFactor:currentDate withGregorianCalendar:gregorianCalendar];
    [components setDay:1];
    [components setMonth:1];
    [components setYear:components.year - 1];

    // Zero out the time components so we get midnight.
    [self gt_zeroOutTimeComponents:&components];
    return [gregorianCalendar dateFromComponents:components];
}

+ (NSDate *)gt_firstDayOfNextYear {
    NSDate *firstDayOfCurrentYear = [self gt_firstDayOfCurrentYear];

    // Set up a "plus 1 year" component.
    NSDateComponents *plusOneYearComponent = [[NSDateComponents alloc] init];
    [plusOneYearComponent setYear:1];

    // Add 1 year to firstDayOfCurrentYear.
    NSCalendar *gregorianCalendar = [[self class] gt_gregorianCalendar_factory];
    return [gregorianCalendar dateByAddingComponents:plusOneYearComponent
                                              toDate:firstDayOfCurrentYear
                                             options:0];
}

#ifdef DEBUG
- (void)gt_logWithComment:(NSString *)comment {
    NSString *output = [NSDateFormatter localizedStringFromDate:self
                                                      dateStyle:NSDateFormatterMediumStyle
                                                      timeStyle:NSDateFormatterMediumStyle];
    NSLog(@"%@: %@", comment, output);
}
#endif

#pragma mark - Private Helper functions

+ (void)gt_zeroOutTimeComponents:(NSDateComponents **)components {
    [*components setHour:0];
    [*components setMinute:0];
    [*components setSecond:0];
}

+ (NSDate *)gt_firstDayOfQuarterFromDate:(NSDate *)date {
    NSCalendar *gregorianCalendar = [[self class] gt_gregorianCalendar_factory];
    NSDateComponents *components = [self gt_YMDComponentsFactor:date withGregorianCalendar:gregorianCalendar];

    NSInteger quarterNumber = floor((components.month - 1) / 3) + 1;
    // NSLog(@"Quarter number: %d", quarterNumber);

    NSInteger firstMonthOfQuarter = (quarterNumber - 1) * 3 + 1;
    [components setMonth:firstMonthOfQuarter];
    [components setDay:1];

    // Zero out the time components so we get midnight.
    [self gt_zeroOutTimeComponents:&components];
    return [gregorianCalendar dateFromComponents:components];
}



- (NSDate*) gt_dateFloor {
    NSCalendar *gregorianCalendar = [[self class] gt_gregorianCalendar_factory];

    NSDateComponents* dateComponents = [[self class]gt_YMDComponentsFactor:self withGregorianCalendar:gregorianCalendar];

    return [gregorianCalendar dateFromComponents:dateComponents];
}

- (NSDate*) gt_dateCeil {
    NSCalendar *gregorianCalendar = [[self class] gt_gregorianCalendar_factory];

    NSDateComponents* dateComponents = [[self class] gt_YMDComponentsFactor:self withGregorianCalendar:gregorianCalendar];

    [dateComponents setHour:23];
    [dateComponents setMinute:59];
    [dateComponents setSecond:59];

    return [gregorianCalendar dateFromComponents:dateComponents];
}

- (NSDate*) gt_startOfWeek {
    NSCalendar *gregorianCalendar = [[self class] gt_gregorianCalendar_factory];

#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_8_0
    NSDateComponents *components;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0f){
        components = [gregorianCalendar components: NSCalendarUnitWeekday | NSCalendarUnitYear |NSCalendarUnitMonth |NSCalendarUnitDay  fromDate:self];
    }else{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        components = [gregorianCalendar components:NSWeekdayCalendarUnit | NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit fromDate:self];
#pragma clang diagnostic pop
    }
#else
    NSDateComponents *components = [gregorianCalendar components:NSWeekdayCalendarUnit | NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit fromDate:self];
#endif

    [components setDay:([components day] - ([components weekday] - 1))];

    return [gregorianCalendar dateFromComponents:components];
}

- (NSDate*) gt_endOfWeek {
    NSCalendar *gregorianCalendar = [[self class] gt_gregorianCalendar_factory];

#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_8_0
    NSDateComponents *components;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0f){
        components = [gregorianCalendar components: NSCalendarUnitWeekday | NSCalendarUnitYear |NSCalendarUnitMonth |NSCalendarUnitDay  fromDate:self];
    }else{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        components = [gregorianCalendar components:NSWeekdayCalendarUnit | NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit fromDate:self];
#pragma clang diagnostic pop
    }
#else
    NSDateComponents *components = [gregorianCalendar components:NSWeekdayCalendarUnit | NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit fromDate:self];
#endif

    [components setDay:([components day] + (7 - [components weekday]))];
    [components setHour:23];
    [components setMinute:59];
    [components setSecond:59];

    return [gregorianCalendar dateFromComponents:components];
}

- (NSDate*) gt_startOfMonth {
    NSCalendar *gregorianCalendar = [[self class] gt_gregorianCalendar_factory];

#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_8_0
    NSDateComponents *components;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0f){
        components = [gregorianCalendar components:NSCalendarUnitYear |NSCalendarUnitMonth  fromDate:self];
    }else{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        components = [gregorianCalendar components:NSYearCalendarUnit | NSMonthCalendarUnit fromDate:self];
#pragma clang diagnostic pop
    }
#else
    NSDateComponents *components = [gregorianCalendar components: NSYearCalendarUnit | NSMonthCalendarUnit fromDate:self];
#endif

    return [gregorianCalendar dateFromComponents:components];
}

- (NSDate*) gt_endOfMonth {
    NSCalendar *gregorianCalendar = [[self class] gt_gregorianCalendar_factory];

#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_8_0
    NSDateComponents *components;
    NSRange dayRange;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0f){
        components = [gregorianCalendar components:NSCalendarUnitYear |NSCalendarUnitMonth  fromDate:self];
        dayRange = [gregorianCalendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:self];

    }else{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        components = [gregorianCalendar components:NSYearCalendarUnit | NSMonthCalendarUnit fromDate:self];
        dayRange = [gregorianCalendar rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:self];
#pragma clang diagnostic pop
    }
#else
    NSDateComponents *components = [gregorianCalendar components: NSYearCalendarUnit | NSMonthCalendarUnit fromDate:self];
    NSRange dayRange = [gregorianCalendar rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:workingDate];
#endif



    [components setDay:dayRange.length];
    [components setHour:23];
    [components setMinute:59];
    [components setSecond:59];

    return [gregorianCalendar dateFromComponents:components];
}

- (NSDate*) gt_startOfYear {
    NSCalendar *gregorianCalendar = [[self class] gt_gregorianCalendar_factory];

#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_8_0
    NSDateComponents *components;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0f){
        components = [gregorianCalendar components:NSCalendarUnitYear fromDate:self];
    }else{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        components = [gregorianCalendar components:NSYearCalendarUnit fromDate:self];
#pragma clang diagnostic pop
    }
#else
    NSDateComponents *components = [gregorianCalendar components: NSYearCalendarUnit fromDate:self];
#endif

    return [gregorianCalendar dateFromComponents:components];
}

- (NSDate*) gt_endOfYear {
    NSCalendar *gregorianCalendar = [[self class] gt_gregorianCalendar_factory];

#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_8_0
    NSDateComponents *components;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0f){
        components = [gregorianCalendar components:NSCalendarUnitYear fromDate:self];
    }else{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        components = [gregorianCalendar components:NSYearCalendarUnit fromDate:self];
#pragma clang diagnostic pop
    }
#else
    NSDateComponents *components = [gregorianCalendar components: NSYearCalendarUnit fromDate:self];
#endif
    [components setDay:31];
    [components setMonth:12];
    [components setHour:23];
    [components setMinute:59];
    [components setSecond:59];

    return [gregorianCalendar dateFromComponents:components];
}

- (NSDate*) gt_previousDay {
    return [self dateByAddingTimeInterval:-86400];
}

- (NSDate*) gt_nextDay {
    return [self dateByAddingTimeInterval:86400];
}

- (NSDate*) gt_previousWeek {
    return [self dateByAddingTimeInterval:-(86400*7)];
}

- (NSDate*) gt_nextWeek {
    return [self dateByAddingTimeInterval:+(86400*7)];
}

- (NSDate*) gt_previousMonth {
    return [self gt_previousMonth:1];
}

- (NSDate*) gt_previousMonth:(NSUInteger) monthsToMove {
    NSCalendar *gregorianCalendar = [[self class] gt_gregorianCalendar_factory];

    NSDateComponents* components =[[self class] gt_YMDComponentsFactor:self withGregorianCalendar:gregorianCalendar];

    NSInteger dayInMonth = [components day];

    // Update the components, initially setting the day in month to 0
    NSInteger newMonth = ([components month] - monthsToMove);
    [components setDay:1];
    [components setMonth:newMonth];

    // Determine the valid day range for that month
    NSDate* workingDate = [gregorianCalendar dateFromComponents:components];
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_8_0
    NSRange dayRange;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0f){
        dayRange = [gregorianCalendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:workingDate];

    }else{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        dayRange = [gregorianCalendar rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:workingDate];
#pragma clang diagnostic pop
    }
#else
    NSRange dayRange = [gregorianCalendar rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:workingDate];
#endif

    // Set the day clamping to the maximum number of days in that month
    [components setDay:MIN(dayInMonth, dayRange.length)];

    return [gregorianCalendar dateFromComponents:components];
}

- (NSDate*) gt_nextMonth {
    return [self gt_nextMonth:1];
}

- (NSDate*) gt_nextMonth:(NSUInteger) monthsToMove {
    NSCalendar *gregorianCalendar = [[self class] gt_gregorianCalendar_factory];

    NSDateComponents* components = [[self class] gt_YMDComponentsFactor:self withGregorianCalendar:gregorianCalendar];

    NSInteger dayInMonth = [components day];

    // Update the components, initially setting the day in month to 0
    NSInteger newMonth = ([components month] + monthsToMove);
    [components setDay:1];
    [components setMonth:newMonth];

    // Determine the valid day range for that month
    NSDate* workingDate = [gregorianCalendar dateFromComponents:components];
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_8_0
    NSRange dayRange;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0f){
        dayRange = [gregorianCalendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:workingDate];

    }else{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        dayRange = [gregorianCalendar rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:workingDate];
#pragma clang diagnostic pop
    }
#else
    NSRange dayRange = [gregorianCalendar rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:workingDate];
#endif
    // Set the day clamping to the maximum number of days in that month
    [components setDay:MIN(dayInMonth, dayRange.length)];

    return [gregorianCalendar dateFromComponents:components];
}

@end
