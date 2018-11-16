//
//  NSString+GTBase64.h
//  FBSnapshotTestCase
//
//  Created by liuxc on 2018/11/16.
//

#import <Foundation/Foundation.h>

@interface NSString (GTBase64)

+ (NSString *)gt_stringWithBase64EncodedString:(NSString *)string;
- (NSString *)gt_base64EncodedStringWithWrapWidth:(NSUInteger)wrapWidth;
- (NSString *)gt_base64EncodedString;
- (NSString *)gt_base64DecodedString;
- (NSData *)gt_base64DecodedData;

@end
