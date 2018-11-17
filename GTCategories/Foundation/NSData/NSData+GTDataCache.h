//
//  NSData+GTDataCache.h
//  GTCategories
//
//  Created by liuxc on 2018/11/16.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>

#define kSDMaxCacheFileAmount 100

@interface NSData (GTDataCache)

/**
 *  将URL作为key保存到磁盘里缓存起来
 *
 *  @param identifier url.absoluteString
 */
- (void)gt_saveDataCacheWithIdentifier:(NSString *)identifier;

/**
 *  取出缓存data
 *
 *  @param identifier url.absoluteString
 *
 *  @return 缓存
 */
+ (NSData *)gt_getDataCacheWithIdentifier:(NSString *)identifier;

@end
