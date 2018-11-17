//
//  UIScrollView+GTAddition.h
//  GTCategories
//
//  Created by liuxc on 2018/11/16.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, GTScrollDirection) {
    GTScrollDirectionUp,
    GTScrollDirectionDown,
    GTScrollDirectionLeft,
    GTScrollDirectionRight,
    GTScrollDirectionWTF
};

@interface UIScrollView (GTAddition)

@property(nonatomic) CGFloat gt_contentWidth;
@property(nonatomic) CGFloat gt_contentHeight;
@property(nonatomic) CGFloat gt_contentOffsetX;
@property(nonatomic) CGFloat gt_contentOffsetY;

- (CGPoint)gt_topContentOffset;
- (CGPoint)gt_bottomContentOffset;
- (CGPoint)gt_leftContentOffset;
- (CGPoint)gt_rightContentOffset;

- (GTScrollDirection)gt_ScrollDirection;

- (BOOL)gt_isScrolledToTop;
- (BOOL)gt_isScrolledToBottom;
- (BOOL)gt_isScrolledToLeft;
- (BOOL)gt_isScrolledToRight;
- (void)gt_scrollToTopAnimated:(BOOL)animated;
- (void)gt_scrollToBottomAnimated:(BOOL)animated;
- (void)gt_scrollToLeftAnimated:(BOOL)animated;
- (void)gt_scrollToRightAnimated:(BOOL)animated;

- (NSUInteger)gt_verticalPageIndex;
- (NSUInteger)gt_horizontalPageIndex;

- (void)gt_scrollToVerticalPageIndex:(NSUInteger)pageIndex animated:(BOOL)animated;
- (void)gt_scrollToHorizontalPageIndex:(NSUInteger)pageIndex animated:(BOOL)animated;

@end
