//
//  NSData+GTHash.h
//  GTCategories
//
//  Created by liuxc on 2018/11/16.
//

#import <Foundation/Foundation.h>

@interface NSData (GTHash)

#pragma mark - Hash
/**
 *  @brief  md5 NSData
 */
@property (readonly) NSData *gt_md5Data;
/**
 *  @brief  sha1Data NSData
 */
@property (readonly) NSData *gt_sha1Data;
/**
 *  @brief  sha256Data NSData
 */
@property (readonly) NSData *gt_sha256Data;
/**
 *  @brief  sha512Data NSData
 */
@property (readonly) NSData *gt_sha512Data;

/**
 *  @brief  md5 NSData
 *
 *  @param key 密钥
 *
 *  @return 结果
 */
- (NSData *)gt_hmacMD5DataWithKey:(NSData *)key;
/**
 *  @brief  sha1Data NSData
 *
 *  @param key 密钥
 *
 *  @return 结果
 */
- (NSData *)gt_hmacSHA1DataWithKey:(NSData *)key;
/**
 *  @brief  sha256Data NSData
 *
 *  @param key 密钥
 *
 *  @return 结果
 */
- (NSData *)gt_hmacSHA256DataWithKey:(NSData *)key;
/**
 *  @brief  sha512Data NSData
 *
 *  @param key 密钥
 *
 *  @return 结果
 */
- (NSData *)gt_hmacSHA512DataWithKey:(NSData *)key;

@end
