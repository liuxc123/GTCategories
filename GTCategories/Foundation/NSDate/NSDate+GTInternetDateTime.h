//
//  NSDate+GTInternetDateTime.h
//  FBSnapshotTestCase
//
//  Created by liuxc on 2018/11/16.
//

#import <Foundation/Foundation.h>

// Formatting hints
typedef enum {
    DateFormatHintNone,
    DateFormatHintRFC822,
    DateFormatHintRFC3339
} DateFormatHint;

// A category to parse internet date & time strings
@interface NSDate (GTInternetDateTime)

// Get date from RFC3339 or RFC822 string
// - A format/specification hint can be used to speed up,
//   otherwise both will be attempted in order to get a date
+ (NSDate *)gt_dateFromInternetDateTimeString:(NSString *)dateString
                                   formatHint:(DateFormatHint)hint;

// Get date from a string using a specific date specification
+ (NSDate *)gt_dateFromRFC3339String:(NSString *)dateString;
+ (NSDate *)gt_dateFromRFC822String:(NSString *)dateString;

@end
