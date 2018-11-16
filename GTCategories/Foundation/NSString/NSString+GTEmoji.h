//
//  NSString+GTEmoji.h
//  FBSnapshotTestCase
//
//  Created by liuxc on 2018/11/16.
//
/**
 NSString (Emoji) extends the NSString class to provide custom functionality
 related to the Emoji emoticons.

 Through this category, it is possible to turn cheat codes from
 Emoji Cheat Sheet <http://www.emoji-cheat-sheet.com> into unicode emoji characters
 and vice versa (useful if you need to POST a message typed by the user to a remote service).
 */
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface NSString (GTEmoji)

/**
 Returns a NSString in which any occurrences that match the cheat codes
 from Emoji Cheat Sheet <http://www.emoji-cheat-sheet.com> are replaced by the
 corresponding unicode characters.

 Example:
 "This is a smiley face :smiley:"

 Will be replaced with:
 "This is a smiley face \U0001F604"
 */
- (NSString *)gt_stringByReplacingEmojiCheatCodesWithUnicode;

/**
 Returns a NSString in which any occurrences that match the unicode characters
 of the emoji emoticons are replaced by the corresponding cheat codes from
 Emoji Cheat Sheet <http://www.emoji-cheat-sheet.com>.

 Example:
 "This is a smiley face \U0001F604"

 Will be replaced with:
 "This is a smiley face :smiley:"
 */
- (NSString *)gt_stringByReplacingEmojiUnicodeWithCheatCodes;

@end
