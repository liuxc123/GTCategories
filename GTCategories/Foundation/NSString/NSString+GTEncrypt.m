//
//  NSString+GTEncrypt.m
//  FBSnapshotTestCase
//
//  Created by liuxc on 2018/11/16.
//
// 加密解密工具 http://tool.chacuo.net/cryptdes

#import "NSString+GTEncrypt.h"
#import "NSData+GTEncrypt.h"
#import "NSData+GTBase64.h"

@implementation NSString (GTEncrypt)

-(NSString*)gt_encryptedWithAESUsingKey:(NSString*)key andIV:(NSData*)iv {
    NSData *encrypted = [[self dataUsingEncoding:NSUTF8StringEncoding] gt_encryptedWithAESUsingKey:key andIV:iv];
    NSString *encryptedString = [encrypted gt_base64EncodedString];

    return encryptedString;
}

- (NSString*)gt_decryptedWithAESUsingKey:(NSString*)key andIV:(NSData*)iv {
    NSData *decrypted = [[NSData gt_dataWithBase64EncodedString:self] gt_decryptedWithAESUsingKey:key andIV:iv];
    NSString *decryptedString = [[NSString alloc] initWithData:decrypted encoding:NSUTF8StringEncoding];

    return decryptedString;
}

- (NSString*)gt_encryptedWithDESUsingKey:(NSString*)key andIV:(NSData*)iv {
    NSData *encrypted = [[self dataUsingEncoding:NSUTF8StringEncoding] gt_encryptedWithDESUsingKey:key andIV:iv];
    NSString *encryptedString = [encrypted gt_base64EncodedString];

    return encryptedString;
}

- (NSString*)gt_decryptedWithDESUsingKey:(NSString*)key andIV:(NSData*)iv {
    NSData *decrypted = [[NSData gt_dataWithBase64EncodedString:self] gt_decryptedWithDESUsingKey:key andIV:iv];
    NSString *decryptedString = [[NSString alloc] initWithData:decrypted encoding:NSUTF8StringEncoding];

    return decryptedString;
}

- (NSString*)gt_encryptedWith3DESUsingKey:(NSString*)key andIV:(NSData*)iv {
    NSData *encrypted = [[self dataUsingEncoding:NSUTF8StringEncoding] gt_encryptedWith3DESUsingKey:key andIV:iv];
    NSString *encryptedString = [encrypted gt_base64EncodedString];

    return encryptedString;
}

- (NSString*)gt_decryptedWith3DESUsingKey:(NSString*)key andIV:(NSData*)iv {
    NSData *decrypted = [[NSData gt_dataWithBase64EncodedString:self] gt_decryptedWith3DESUsingKey:key andIV:iv];
    NSString *decryptedString = [[NSString alloc] initWithData:decrypted encoding:NSUTF8StringEncoding];

    return decryptedString;
}

@end
