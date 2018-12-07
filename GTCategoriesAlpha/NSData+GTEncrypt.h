//
//  NSData+GTEncrypt.h
//  GTCategories
//
//  Created by liuxc on 2018/11/16.
//
// 加密解密工具 http://tool.chacuo.net/cryptdes

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonCryptor.h>


@interface NSData (GTEncrypt)


/**
 *  利用AES加密数据
 *
 *  @param key  key 长度一般为16（AES算法所能支持的密钥长度可以为128,192,256位（也即16，24，32个字节））
 *  @param iv  iv description
 *
 *  @return data
 */
- (NSData *)gt_encryptedWithAESUsingKey:(NSString*)key andIV:(NSData*)iv;
/**
 *  @brief  利用AES解密据
 *
 *  @param key key 长度一般为16 （AES算法所能支持的密钥长度可以为128,192,256位（也即16，24，32个字节））
 *  @param iv  iv
 *
 *  @return 解密后数据
 */
- (NSData *)gt_decryptedWithAESUsingKey:(NSString*)key andIV:(NSData*)iv;
/**
 *  利用DES加密数据
 *
 *  @param key key 长度一般为8
 *  @param iv  iv description
 *
 *  @return data
 */
- (NSData *)gt_encryptedWithDESUsingKey:(NSString*)key andIV:(NSData*)iv;
/**
 *  @brief   利用DES解密数据
 *
 *  @param key key 长度一般为8
 *  @param iv  iv
 *
 *  @return 解密后数据
 */
- (NSData *)gt_decryptedWithDESUsingKey:(NSString*)key andIV:(NSData*)iv;
/**
 *  利用3DES加密数据
 *
 *  @param key key 长度一般为24
 *  @param iv  iv description
 *
 *  @return data
 */
- (NSData *)gt_encryptedWith3DESUsingKey:(NSString*)key andIV:(NSData*)iv;
/**
 *  @brief   利用3DES解密数据
 *
 *  @param key key 长度一般为24
 *  @param iv  iv
 *
 *  @return 解密后数据
 */
- (NSData *)gt_decryptedWith3DESUsingKey:(NSString*)key andIV:(NSData*)iv;


- (NSData *)gt_CCCryptData:(NSData *)data
                 algorithm:(CCAlgorithm)algorithm
                 operation:(CCOperation)operation
                       key:(NSString *)key
                        iv:(NSData *)iv;
/**
 *  @brief  NSData 转成UTF8 字符串
 *
 *  @return 转成UTF8 字符串
 */
- (NSString *)gt_UTF8String;

@end
