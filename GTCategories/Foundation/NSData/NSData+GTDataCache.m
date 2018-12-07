//
//  NSData+GTDataCache.m
//  GTCategories
//
//  Created by liuxc on 2018/11/16.
//

#import "NSData+GTDataCache.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSData (GTDataCache)

+ (NSString *)gt_cachePath
{
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject];
    path = [path stringByAppendingPathComponent:@"Caches"];
    path = [path stringByAppendingPathComponent:@"GTDataCache"];
    if (![[NSFileManager defaultManager] fileExistsAtPath:path]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
    }
    return path;
}

+ (NSString *)gt_creatMD5StringWithString:(NSString *)string
{
    const char *original_str = [string UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(original_str, (CC_LONG)strlen(original_str), result);
    NSMutableString *hash = [NSMutableString string];
    for (int i = 0; i < 16; i++)
        [hash appendFormat:@"%02X", result[i]];
    [hash lowercaseString];
    return hash;
}

+ (NSString *)gt_creatDataPathWithString:(NSString *)string
{
    NSString *path = [NSData gt_cachePath];
    path = [path stringByAppendingPathComponent:[self gt_creatMD5StringWithString:string]];
    return path;
}

- (void)gt_saveDataCacheWithIdentifier:(NSString *)identifier
{
    NSString *path = [NSData gt_creatDataPathWithString:identifier];
    [self writeToFile:path atomically:YES];
}

+ (NSData *)gt_getDataCacheWithIdentifier:(NSString *)identifier
{
    static BOOL isCheckedCacheDisk = NO;
    if (!isCheckedCacheDisk) {
        NSFileManager *manager = [NSFileManager defaultManager];
        NSArray *contents = [manager contentsOfDirectoryAtPath:[self gt_cachePath] error:nil];
        if (contents.count >= kSDMaxCacheFileAmount) {
            [manager removeItemAtPath:[self gt_cachePath] error:nil];
        }
        isCheckedCacheDisk = YES;
    }
    NSString *path = [self gt_creatDataPathWithString:identifier];
    NSData *data = [NSData dataWithContentsOfFile:path];
    return data;
}

@end
