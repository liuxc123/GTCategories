//
//  NSString+GTRemoveEmoji.h
//  FBSnapshotTestCase
//
//  Created by liuxc on 2018/11/16.
//

#import <Foundation/Foundation.h>

@interface NSString (GTRemoveEmoji)

///移除所有emoji，以“”替换
- (NSString *)gt_removingEmoji;
///移除所有emoji，以“”替换
- (NSString *)gt_stringByRemovingEmoji;
///移除所有emoji，以string替换
- (NSString *)gt_stringByReplaceingEmojiWithString:(NSString*)string;

///字符串是否包含emoji
- (BOOL)gt_containsEmoji;
///字符串中包含的所有emoji unicode格式
- (NSArray<NSString *>*)gt_allEmoji;
///字符串中包含的所有emoji
- (NSString *)gt_allEmojiString;
///字符串中包含的所有emoji rang
- (NSArray<NSString *>*)gt_allEmojiRanges;

///所有emoji表情
+ (NSString*)gt_allSystemEmoji;

@end

@interface NSCharacterSet (GTEmojiCharacterSet)

+ (NSCharacterSet *)gt_emojiCharacterSet;

@end
