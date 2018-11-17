//
//  NSFileManager+GTPaths.h
//  GTCategories
//
//  Created by liuxc on 2018/11/16.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (GTPaths)

/**
 Get URL of Documents directory.

 @return Documents directory URL.
 */
+ (NSURL *)gt_documentsURL;

/**
 Get path of Documents directory.

 @return Documents directory path.
 */
+ (NSString *)gt_documentsPath;

/**
 Get URL of Library directory.

 @return Library directory URL.
 */
+ (NSURL *)gt_libraryURL;

/**
 Get path of Library directory.

 @return Library directory path.
 */
+ (NSString *)gt_libraryPath;

/**
 Get URL of Caches directory.

 @return Caches directory URL.
 */
+ (NSURL *)gt_cachesURL;

/**
 Get path of Caches directory.

 @return Caches directory path.
 */
+ (NSString *)gt_cachesPath;

/**
 Adds a special filesystem flag to a file to avoid iCloud backup it.

 @param path Path to a file to set an attribute.
 */
+ (BOOL)gt_addSkipBackupAttributeToFile:(NSString *)path;

/**
 Get available disk space.

 @return An amount of available disk space in Megabytes.
 */
+ (double)gt_availableDiskSpace;


/**
 get folder space

 @param folderPath fordler path
 @return size
 */
- (unsigned long long)gt_sizeOfFolder:(NSString *)folderPath;

@end
