//
//  NSDate+GTReporting.h
//  FBSnapshotTestCase
//
//  Created by liuxc on 2018/11/16.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSDate (GTReporting)


// Return a date with a specified year, month and day.
+ (NSDate *)gt_dateWithYear:(int)year month:(int)month day:(int)day;

// Return midnight on the specified date.
+ (NSDate *)gt_midnightOfDate:(NSDate *)date;

// Return midnight today.
+ (NSDate *)gt_midnightToday;

// Return midnight tomorrow.
+ (NSDate *)gt_midnightTomorrow;

// Returns a date that is exactly 1 day after the specified date. Does *not*
// zero out the time components. For example, if the specified date is
// April 15 2012 10:00 AM, the return value will be April 16 2012 10:00 AM.
+ (NSDate *)gt_oneDayAfter:(NSDate *)date;

// Returns midnight of the first day of the current, previous or next Month.
// Note: firstDayOfNextMonth returns midnight of the first day of next month,
// which is effectively the same as the "last moment" of the current month.
+ (NSDate *)gt_firstDayOfCurrentMonth;
+ (NSDate *)gt_firstDayOfPreviousMonth;
+ (NSDate *)gt_firstDayOfNextMonth;

// Returns midnight of the first day of the current, previous or next Quarter.
// Note: firstDayOfNextQuarter returns midnight of the first day of next quarter,
// which is effectively the same as the "last moment" of the current quarter.
+ (NSDate *)gt_firstDayOfCurrentQuarter;
+ (NSDate *)gt_firstDayOfPreviousQuarter;
+ (NSDate *)gt_firstDayOfNextQuarter;

// Returns midnight of the first day of the current, previous or next Year.
// Note: firstDayOfNextYear returns midnight of the first day of next year,
// which is effectively the same as the "last moment" of the current year.
+ (NSDate *)gt_firstDayOfCurrentYear;
+ (NSDate *)gt_firstDayOfPreviousYear;
+ (NSDate *)gt_firstDayOfNextYear;


- (NSDate *)gt_dateFloor;
- (NSDate *)gt_dateCeil;

- (NSDate *)gt_startOfWeek;
- (NSDate *)gt_endOfWeek;

- (NSDate *)gt_startOfMonth;
- (NSDate *)gt_endOfMonth;

- (NSDate *)gt_startOfYear;
- (NSDate *)gt_endOfYear;

- (NSDate *)gt_previousDay;
- (NSDate *)gt_nextDay;

- (NSDate *)gt_previousWeek;
- (NSDate *)gt_nextWeek;

- (NSDate *)gt_previousMonth;
- (NSDate *)gt_previousMonth:(NSUInteger) monthsToMove;
- (NSDate *)gt_nextMonth;
- (NSDate *)gt_nextMonth:(NSUInteger) monthsToMove;

#ifdef DEBUG
// For testing only. A helper function to format and display a date
// with an optional comment. For example:
//     NSDate *test = [NSDate firstDayOfCurrentMonth];
//     [test logWithComment:@"First day of current month: "];
- (void)gt_logWithComment:(NSString *)comment;
#endif


@end
