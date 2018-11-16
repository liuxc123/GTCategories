//
//  NSString+GTMatcher.h
//  FBSnapshotTestCase
//
//  Created by liuxc on 2018/11/16.
//
//https://github.com/damienromito/NSString-Matcher

#import <Foundation/Foundation.h>

@interface NSString (GTMatcher)

- (NSArray *)gt_matchWithRegex:(NSString *)regex;
- (NSString *)gt_matchWithRegex:(NSString *)regex atIndex:(NSUInteger)index;
- (NSString *)gt_firstMatchedGroupWithRegex:(NSString *)regex;
- (NSTextCheckingResult *)gt_firstMatchedResultWithRegex:(NSString *)regex;

@end
