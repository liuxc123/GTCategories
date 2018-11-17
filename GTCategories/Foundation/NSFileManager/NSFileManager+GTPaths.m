//
//  NSFileManager+GTPaths.m
//  GTCategories
//
//  Created by liuxc on 2018/11/16.
//

#import "NSFileManager+GTPaths.h"

@implementation NSFileManager (GTPaths)

+ (NSURL *)gt_URLForDirectory:(NSSearchPathDirectory)directory
{
    return [self.defaultManager URLsForDirectory:directory inDomains:NSUserDomainMask].lastObject;
}

+ (NSString *)gt_pathForDirectory:(NSSearchPathDirectory)directory
{
    return NSSearchPathForDirectoriesInDomains(directory, NSUserDomainMask, YES)[0];
}

+ (NSURL *)gt_documentsURL
{
    return [self gt_URLForDirectory:NSDocumentDirectory];
}

+ (NSString *)gt_documentsPath
{
    return [self gt_pathForDirectory:NSDocumentDirectory];
}

+ (NSURL *)gt_libraryURL
{
    return [self gt_URLForDirectory:NSLibraryDirectory];
}

+ (NSString *)gt_libraryPath
{
    return [self gt_pathForDirectory:NSLibraryDirectory];
}

+ (NSURL *)gt_cachesURL
{
    return [self gt_URLForDirectory:NSCachesDirectory];
}

+ (NSString *)gt_cachesPath
{
    return [self gt_pathForDirectory:NSCachesDirectory];
}

+ (BOOL)gt_addSkipBackupAttributeToFile:(NSString *)path
{
    return [[NSURL.alloc initFileURLWithPath:path] setResourceValue:@(YES) forKey:NSURLIsExcludedFromBackupKey error:nil];
}

+ (double)gt_availableDiskSpace
{
    NSDictionary *attributes = [self.defaultManager attributesOfFileSystemForPath:self.gt_documentsPath error:nil];

    return [attributes[NSFileSystemFreeSize] unsignedLongLongValue] / (double)0x100000;
}

- (unsigned long long)gt_sizeOfFolder:(NSString *)folderPath
{
    NSArray *contents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:folderPath error:nil];
    NSEnumerator *contentsEnumurator = [contents objectEnumerator];

    NSString *file;
    unsigned long long folderSize = 0;

    while (file = [contentsEnumurator nextObject]) {
        NSDictionary *fileAttributes = [[NSFileManager defaultManager] attributesOfItemAtPath:[folderPath stringByAppendingPathComponent:file] error:nil];
        folderSize += [[fileAttributes objectForKey:NSFileSize] intValue];
    }
    return folderSize;
}

@end
