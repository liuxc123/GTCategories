//
//  NSString+GTEncrypt.h
//  FBSnapshotTestCase
//
//  Created by liuxc on 2018/11/16.
//
// 加密解密工具 http://tool.chacuo.net/cryptdes

#import <Foundation/Foundation.h>

@interface NSString (GTEncrypt)

/**
 *  AES加密数据
 *
 *  @param key  key 长度一般为16（AES算法所能支持的密钥长度可以为128,192,256位（也即16，24，32个字节））
 *  @param iv  iv
 *
 *  @return data
 */
- (NSString*)gt_encryptedWithAESUsingKey:(NSString*)key andIV:(NSData*)iv;
/**
 *  AES解密数据
 *
 *  @param key key 长度一般为16
 *  @param iv  iv
 *
 *  @return data
 */
- (NSString*)gt_decryptedWithAESUsingKey:(NSString*)key andIV:(NSData*)iv;

/**
 *  DES加密数据
 *
 *  @param key key 长度一般为8
 *  @param iv  iv
 *
 *  @return data
 */
- (NSString*)gt_encryptedWithDESUsingKey:(NSString*)key andIV:(NSData*)iv;
/**
 *  DE解密数据
 *
 *  @param key key 长度一般为8
 *  @param iv  iv
 *
 *  @return data
 */
- (NSString*)gt_decryptedWithDESUsingKey:(NSString*)key andIV:(NSData*)iv;

/**
 *  3DES加密数据
 *
 *  @param key key 长度一般为24
 *  @param iv  iv
 *
 *  @return data
 */
- (NSString*)gt_encryptedWith3DESUsingKey:(NSString*)key andIV:(NSData*)iv;
/**
 *  3DES解密数据
 *
 *  @param key key 长度一般为24
 *  @param iv  iv
 *
 *  @return data
 */
- (NSString*)gt_decryptedWith3DESUsingKey:(NSString*)key andIV:(NSData*)iv;


@end
