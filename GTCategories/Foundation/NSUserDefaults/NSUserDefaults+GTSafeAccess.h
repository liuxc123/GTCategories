//
//  NSUserDefaults+GTSafeAccess.h
//  FBSnapshotTestCase
//
//  Created by liuxc on 2018/11/16.
//

#import <Foundation/Foundation.h>

@interface NSUserDefaults (GTSafeAccess)

+ (NSString *)gt_stringForKey:(NSString *)defaultName;

+ (NSArray *)gt_arrayForKey:(NSString *)defaultName;

+ (NSDictionary *)gt_dictionaryForKey:(NSString *)defaultName;

+ (NSData *)gt_dataForKey:(NSString *)defaultName;

+ (NSArray *)gt_stringArrayForKey:(NSString *)defaultName;

+ (NSInteger)gt_integerForKey:(NSString *)defaultName;

+ (float)gt_floatForKey:(NSString *)defaultName;

+ (double)gt_doubleForKey:(NSString *)defaultName;

+ (BOOL)gt_boolForKey:(NSString *)defaultName;

+ (NSURL *)gt_URLForKey:(NSString *)defaultName;

#pragma mark - WRITE FOR STANDARD

+ (void)gt_setObject:(id)value forKey:(NSString *)defaultName;

#pragma mark - READ ARCHIVE FOR STANDARD

+ (id)gt_arcObjectForKey:(NSString *)defaultName;

#pragma mark - WRITE ARCHIVE FOR STANDARD

+ (void)gt_setArcObject:(id)value forKey:(NSString *)defaultName;

@end
