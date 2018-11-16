//
//  NSDate+GTFormatter.h
//  FBSnapshotTestCase
//
//  Created by liuxc on 2018/11/16.
//

#import <Foundation/Foundation.h>

@interface NSDate (GTFormatter)

+(NSDateFormatter *)gt_formatter;
+(NSDateFormatter *)gt_formatterWithoutTime;
+(NSDateFormatter *)gt_formatterWithoutDate;

-(NSString *)gt_formatWithUTCTimeZone;
-(NSString *)gt_formatWithLocalTimeZone;
-(NSString *)gt_formatWithTimeZoneOffset:(NSTimeInterval)offset;
-(NSString *)gt_formatWithTimeZone:(NSTimeZone *)timezone;

-(NSString *)gt_formatWithUTCTimeZoneWithoutTime;
-(NSString *)gt_formatWithLocalTimeZoneWithoutTime;
-(NSString *)gt_formatWithTimeZoneOffsetWithoutTime:(NSTimeInterval)offset;
-(NSString *)gt_formatWithTimeZoneWithoutTime:(NSTimeZone *)timezone;

-(NSString *)gt_formatWithUTCWithoutDate;
-(NSString *)gt_formatWithLocalTimeWithoutDate;
-(NSString *)gt_formatWithTimeZoneOffsetWithoutDate:(NSTimeInterval)offset;
-(NSString *)gt_formatTimeWithTimeZone:(NSTimeZone *)timezone;


+ (NSString *)gt_currentDateStringWithFormat:(NSString *)format;
+ (NSDate *)gt_dateWithSecondsFromNow:(NSInteger)seconds;
+ (NSDate *)gt_dateWithYear:(NSInteger)year month:(NSUInteger)month day:(NSUInteger)day;
- (NSString *)gt_dateWithFormat:(NSString *)format;

@end
