//
//  NSString+GTPinyin.h
//  FBSnapshotTestCase
//
//  Created by liuxc on 2018/11/16.
//
// https://github.com/croath/NSString-Pinyin
//  the Chinese Pinyin string of the nsstring

#import <Foundation/Foundation.h>

@interface NSString (GTPinyin)

- (NSString*)gt_pinyinWithPhoneticSymbol;
- (NSString*)gt_pinyin;
- (NSArray*)gt_pinyinArray;
- (NSString*)gt_pinyinWithoutBlank;
- (NSArray*)gt_pinyinInitialsArray;
- (NSString*)gt_pinyinInitialsString;

@end
