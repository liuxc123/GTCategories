//
//  NSString+GTBase64.m
//  FBSnapshotTestCase
//
//  Created by liuxc on 2018/11/16.
//

#import "NSString+GTBase64.h"
#import "NSData+GTBase64.h"

@implementation NSString (GTBase64)

+ (NSString *)gt_stringWithBase64EncodedString:(NSString *)string
{
    NSData *data = [NSData gt_dataWithBase64EncodedString:string];
    if (data)
    {
        return [[self alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }
    return nil;
}
- (NSString *)gt_base64EncodedStringWithWrapWidth:(NSUInteger)wrapWidth
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    return [data gt_base64EncodedStringWithWrapWidth:wrapWidth];
}
- (NSString *)gt_base64EncodedString
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    return [data gt_base64EncodedString];
}
- (NSString *)gt_base64DecodedString
{
    return [NSString gt_stringWithBase64EncodedString:self];
}
- (NSData *)gt_base64DecodedData
{
    return [NSData gt_dataWithBase64EncodedString:self];
}

@end
