//
//  NSString+GTScore.h
//  GTCategories
//
//  Created by liuxc on 2018/11/16.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSUInteger, NSStringGTScoreOption) {
    NSStringGTScoreOptionNone = 1 << 0,
    NSStringGTScoreOptionFavorSmallerWords = 1 << 1,
    NSStringGTScoreOptionReducedLongStringPenalty = 1 << 2
};

@interface NSString (GTScore)

- (CGFloat)gt_scoreAgainst:(NSString *)otherString;
- (CGFloat)gt_scoreAgainst:(NSString *)otherString fuzziness:(NSNumber *)fuzziness;
- (CGFloat)gt_scoreAgainst:(NSString *)otherString fuzziness:(NSNumber *)fuzziness options:(NSStringGTScoreOption)options;

@end
