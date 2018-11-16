//
//  NSDateFormatter+GTMake.h
//  FBSnapshotTestCase
//
//  Created by liuxc on 2018/11/16.
//

#import <Foundation/Foundation.h>

@interface NSDateFormatter (GTMake)

+(NSDateFormatter *)gt_dateFormatterWithFormat:(NSString *)format;
+(NSDateFormatter *)gt_dateFormatterWithFormat:(NSString *)format timeZone:(NSTimeZone *)timeZone;
+(NSDateFormatter *)gt_dateFormatterWithFormat:(NSString *)format timeZone:(NSTimeZone *)timeZone locale:(NSLocale *)locale;
+(NSDateFormatter *)gt_dateFormatterWithDateStyle:(NSDateFormatterStyle)style;
+(NSDateFormatter *)gt_dateFormatterWithDateStyle:(NSDateFormatterStyle)style timeZone:(NSTimeZone *)timeZone;
+(NSDateFormatter *)gt_dateFormatterWithTimeStyle:(NSDateFormatterStyle)style;
+(NSDateFormatter *)gt_dateFormatterWithTimeStyle:(NSDateFormatterStyle)style timeZone:(NSTimeZone *)timeZone;

@end
