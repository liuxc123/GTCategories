//
//  UIScrollView+GTPages.h
//  FBSnapshotTestCase
//
//  Created by liuxc on 2018/11/16.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (GTPages)

- (NSInteger)gt_pages;
- (NSInteger)gt_currentPage;
- (CGFloat)gt_scrollPercent;

- (CGFloat)gt_pagesY;
- (CGFloat)gt_pagesX;
- (CGFloat)gt_currentPageY;
- (CGFloat)gt_currentPageX;
- (void)gt_setPageY:(CGFloat)page;
- (void)gt_setPageX:(CGFloat)page;
- (void)gt_setPageY:(CGFloat)page animated:(BOOL)animated;
- (void)gt_setPageX:(CGFloat)page animated:(BOOL)animated;

@end
