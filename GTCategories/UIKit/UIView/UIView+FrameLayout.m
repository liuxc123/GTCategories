//
//  UIView+FrameLayout.m
//  GTCategories
//
//  Created by liuxc on 2018/11/16.
//

#import "UIView+FrameLayout.h"
#import <objc/runtime.h>

static void *kUIViewLayoutMethodPropertyBottomGap = &kUIViewLayoutMethodPropertyBottomGap;
static void *kUIViewLayoutMethodPropertyTopGap = &kUIViewLayoutMethodPropertyTopGap;
static void *kUIViewLayoutMethodPropertyLeftGap = &kUIViewLayoutMethodPropertyLeftGap;
static void *kUIViewLayoutMethodPropertyRightGap = &kUIViewLayoutMethodPropertyRightGap;

@implementation UIView (FrameLayout)

// coordinator getters
- (CGFloat)gt_height
{
    return self.frame.size.height;
}

- (CGFloat)gt_width
{
    return self.frame.size.width;
}

- (CGFloat)gt_x
{
    return self.frame.origin.x;
}

- (CGFloat)gt_y
{
    return self.frame.origin.y;
}

- (CGSize)gt_size
{
    return self.frame.size;
}

- (CGPoint)gt_origin
{
    return self.frame.origin;
}

- (CGFloat)gt_centerX
{
    return self.center.x;
}

- (CGFloat)gt_centerY
{
    return self.center.y;
}

- (CGFloat)gt_left
{
    return self.frame.origin.x;
}

- (CGFloat)gt_top
{
    return self.frame.origin.y;
}

- (CGFloat)gt_bottom
{
    return self.frame.size.height + self.frame.origin.y;
}

- (CGFloat)gt_right
{
    return self.frame.size.width + self.frame.origin.x;
}

- (void)setGt_x:(CGFloat)x
{
    self.frame = CGRectMake(x, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
}

- (void)setGt_y:(CGFloat)y
{
    self.frame = CGRectMake(self.frame.origin.x, y, self.frame.size.width, self.frame.size.height);
}

- (void)setGt_left:(CGFloat)left
{
    self.gt_x = left;
}

- (void)setGt_top:(CGFloat)top
{
    self.gt_y = top;
}

- (void)setGt_height:(CGFloat)height
{
    CGRect newFrame = CGRectMake(self.gt_x, self.gt_y, self.gt_width, height);
    self.frame = newFrame;
}

- (void)heightEqualToView:(UIView *)view
{
    self.gt_height = view.gt_height;
}

// width
- (void)setGt_width:(CGFloat)width
{
    CGRect newFrame = CGRectMake(self.gt_x, self.gt_y, width, self.gt_height);
    self.frame = newFrame;
}

- (void)widthEqualToView:(UIView *)view
{
    self.gt_width = view.gt_width;
}

// center
- (void)setGt_centerX:(CGFloat)centerX
{
    CGPoint center = CGPointMake(self.gt_centerX, self.gt_centerY);
    center.x = centerX;
    self.center = center;
}

- (void)setGt_centerY:(CGFloat)centerY
{
    CGPoint center = CGPointMake(self.gt_centerX, self.gt_centerY);
    center.y = centerY;
    self.center = center;
}

- (void)centerXEqualToView:(UIView *)view
{
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewCenterPoint = [superView convertPoint:view.center toView:self.topSuperView];
    CGPoint centerPoint = [self.topSuperView convertPoint:viewCenterPoint toView:self.superview];
    self.gt_centerX = centerPoint.x;
}

- (void)centerYEqualToView:(UIView *)view
{
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewCenterPoint = [superView convertPoint:view.center toView:self.topSuperView];
    CGPoint centerPoint = [self.topSuperView convertPoint:viewCenterPoint toView:self.superview];
    self.gt_centerY = centerPoint.y;
}

- (void)centerEqualToView:(UIView *)view
{
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewCenterPoint = [superView convertPoint:view.center toView:self.topSuperView];
    CGPoint centerPoint = [self.topSuperView convertPoint:viewCenterPoint toView:self.superview];
    self.gt_centerX = centerPoint.x;
    self.gt_centerY = centerPoint.y;
}

// top, bottom, left, right -- Version 1.1.0
- (void)fromTheTop:(CGFloat)distance ofView:(UIView *)view
{
    [self bottom:distance FromView:view];
}

- (void)fromTheBottom:(CGFloat)distance ofView:(UIView *)view
{
    [self top:distance FromView:view];
}

- (void)fromTheLeft:(CGFloat)distance ofView:(UIView *)view
{
    [self left:distance FromView:view];
}

- (void)fromTheRight:(CGFloat)distance ofView:(UIView *)view
{
    [self right:distance FromView:view];
}


- (void)fromTheRelativeTop:(CGFloat)distance ofView:(UIView *)view screenType:(UIScreenType)screenType
{
    [self bottomRatio:distance FromView:view screenType:screenType];
}

- (void)fromTheRelativeBottom:(CGFloat)distance ofView:(UIView *)view screenType:(UIScreenType)screenType
{
    [self topRatio:distance FromView:view screenType:screenType];
}

- (void)fromTheRelativeLeft:(CGFloat)distance ofView:(UIView *)view screenType:(UIScreenType)screenType
{
    [self leftRatio:distance FromView:view screenType:screenType];
}

- (void)fromTheRelativeRight:(CGFloat)distance ofView:(UIView *)view screenType:(UIScreenType)screenType
{
    [self rightRatio:distance FromView:view screenType:screenType];
}


- (void)relativeTopInContainer:(CGFloat)top shouldResize:(BOOL)shouldResize screenType:(UIScreenType)screenType
{
    [self topRatioInContainer:top shouldResize:shouldResize screenType:screenType];
}

- (void)relativeBottomInContainer:(CGFloat)bottom shouldResize:(BOOL)shouldResize screenType:(UIScreenType)screenType
{
    [self bottomRatioInContainer:bottom shouldResize:shouldResize screenType:screenType];
}

- (void)relativeLeftInContainer:(CGFloat)left shouldResize:(BOOL)shouldResize screenType:(UIScreenType)screenType
{
    [self leftRatioInContainer:left shouldResize:shouldResize screenType:screenType];
}

- (void)relativeRightInContainer:(CGFloat)right shouldResize:(BOOL)shouldResize screenType:(UIScreenType)screenType
{
    [self rightRatioInContainer:right shouldResize:shouldResize screenType:screenType];
}


// top, bottom, left, right -- Old Version
- (void)top:(CGFloat)top FromView:(UIView *)view
{
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewOrigin = [superView convertPoint:view.gt_origin toView:self.topSuperView];
    CGPoint newOrigin = [self.topSuperView convertPoint:viewOrigin toView:self.superview];

    self.gt_y = floorf(newOrigin.y + top + view.gt_height);
}

- (void)bottom:(CGFloat)bottom FromView:(UIView *)view
{
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewOrigin = [superView convertPoint:view.gt_origin toView:self.topSuperView];
    CGPoint newOrigin = [self.topSuperView convertPoint:viewOrigin toView:self.superview];

    self.gt_y = newOrigin.y - bottom - self.gt_height;
}

- (void)left:(CGFloat)left FromView:(UIView *)view
{
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewOrigin = [superView convertPoint:view.gt_origin toView:self.topSuperView];
    CGPoint newOrigin = [self.topSuperView convertPoint:viewOrigin toView:self.superview];

    self.gt_x = newOrigin.x - left - self.gt_width;
}

- (void)right:(CGFloat)right FromView:(UIView *)view
{
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewOrigin = [superView convertPoint:view.gt_origin toView:self.topSuperView];
    CGPoint newOrigin = [self.topSuperView convertPoint:viewOrigin toView:self.superview];

    self.gt_x = newOrigin.x + right + view.gt_width;
}

- (void)topRatio:(CGFloat)top FromView:(UIView *)view screenType:(UIScreenType)screenType
{
    CGFloat topRatio = top / screenType;
    CGFloat topValue = topRatio * self.superview.gt_width;
    [self top:topValue FromView:view];
}

- (void)bottomRatio:(CGFloat)bottom FromView:(UIView *)view screenType:(UIScreenType)screenType
{
    CGFloat bottomRatio = bottom / screenType;
    CGFloat bottomValue = bottomRatio * self.superview.gt_width;
    [self bottom:bottomValue FromView:view];
}

- (void)leftRatio:(CGFloat)left FromView:(UIView *)view screenType:(UIScreenType)screenType
{
    CGFloat leftRatio = left / screenType;
    CGFloat leftValue = leftRatio * self.superview.gt_width;
    [self left:leftValue FromView:view];
}

- (void)rightRatio:(CGFloat)right FromView:(UIView *)view screenType:(UIScreenType)screenType
{
    CGFloat rightRatio = right / screenType;
    CGFloat rightValue = rightRatio * self.superview.gt_width;
    [self right:rightValue FromView:view];
}

- (void)topInContainer:(CGFloat)top shouldResize:(BOOL)shouldResize
{
    if (shouldResize) {
        self.gt_height = self.gt_y - top + self.gt_height;
    }
    self.gt_y = top;
}

- (void)bottomInContainer:(CGFloat)bottom shouldResize:(BOOL)shouldResize
{
    if (shouldResize) {
        self.gt_height = self.superview.gt_height - bottom - self.gt_y - self.safeAreaBottomGap;
    } else {
        self.gt_y = self.superview.gt_height - self.gt_height - bottom - self.safeAreaBottomGap;
    }
}

- (void)leftInContainer:(CGFloat)left shouldResize:(BOOL)shouldResize
{
    if (shouldResize) {
        self.gt_width = self.gt_x - left + self.gt_width;
    }
    self.gt_x = left;
}

- (void)rightInContainer:(CGFloat)right shouldResize:(BOOL)shouldResize
{
    if (shouldResize) {
        self.gt_width = self.superview.gt_width - right - self.gt_x;
    } else {
        self.gt_x = self.superview.gt_width - self.gt_width - right;
    }
}

- (void)topRatioInContainer:(CGFloat)top shouldResize:(BOOL)shouldResize screenType:(UIScreenType)screenType
{
    CGFloat topRatio = top / screenType;
    CGFloat topValue = topRatio * self.superview.gt_width;
    [self topInContainer:topValue shouldResize:shouldResize];
}

- (void)bottomRatioInContainer:(CGFloat)bottom shouldResize:(BOOL)shouldResize screenType:(UIScreenType)screenType
{
    CGFloat bottomRatio = bottom / screenType;
    CGFloat bottomValue = bottomRatio * self.superview.gt_width;
    [self bottomInContainer:bottomValue shouldResize:shouldResize];
}

- (void)leftRatioInContainer:(CGFloat)left shouldResize:(BOOL)shouldResize screenType:(UIScreenType)screenType
{
    CGFloat leftRatio = left / screenType;
    CGFloat leftValue = leftRatio * self.superview.gt_width;
    [self leftInContainer:leftValue shouldResize:shouldResize];
}

- (void)rightRatioInContainer:(CGFloat)right shouldResize:(BOOL)shouldResize screenType:(UIScreenType)screenType
{
    CGFloat rightRatio = right / screenType;
    CGFloat rightValue = rightRatio * self.superview.gt_width;
    [self rightInContainer:rightValue shouldResize:shouldResize];
}

- (void)topEqualToView:(UIView *)view
{
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewOrigin = [superView convertPoint:view.gt_origin toView:self.topSuperView];
    CGPoint newOrigin = [self.topSuperView convertPoint:viewOrigin toView:self.superview];

    self.gt_y = newOrigin.y;
}

- (void)bottomEqualToView:(UIView *)view
{
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewOrigin = [superView convertPoint:view.gt_origin toView:self.topSuperView];
    CGPoint newOrigin = [self.topSuperView convertPoint:viewOrigin toView:self.superview];

    self.gt_y = newOrigin.y + view.gt_height - self.gt_height;
}

- (void)leftEqualToView:(UIView *)view
{
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewOrigin = [superView convertPoint:view.gt_origin toView:self.topSuperView];
    CGPoint newOrigin = [self.topSuperView convertPoint:viewOrigin toView:self.superview];

    self.gt_x = newOrigin.x;
}

- (void)rightEqualToView:(UIView *)view
{
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewOrigin = [superView convertPoint:view.gt_origin toView:self.topSuperView];
    CGPoint newOrigin = [self.topSuperView convertPoint:viewOrigin toView:self.superview];

    self.gt_x = newOrigin.x + view.gt_width - self.gt_width;
}

// size
- (void)setGt_size:(CGSize)size
{
    self.frame = CGRectMake(self.gt_x, self.gt_y, size.width, size.height);
}

- (void)setSize:(CGSize)size screenType:(UIScreenType)screenType
{
    CGFloat ratio = SCREEN_WIDTH / screenType;
    self.frame = CGRectMake(self.gt_x, self.gt_y, size.width * ratio, size.height * ratio);
}

- (void)sizeEqualToView:(UIView *)view
{
    self.frame = CGRectMake(self.gt_x, self.gt_y, view.gt_width, view.gt_height);
}

// imbueset
- (void)fillWidth
{
    self.gt_width = self.superview.gt_width;
    self.gt_x = 0;
}

- (void)fillHeight
{
    self.gt_height = self.superview.gt_height;
    self.gt_y = 0;
}

- (void)fill
{
    self.frame = CGRectMake(0, 0, self.superview.gt_width, self.superview.gt_height);
}

- (UIView *)topSuperView
{
    UIView *topSuperView = self.superview;

    if (topSuperView == nil) {
        topSuperView = self;
    } else {
        while (topSuperView.superview) {
            topSuperView = topSuperView.superview;
        }
    }

    return topSuperView;
}

// iPhoneX adapt
- (CGFloat)safeAreaBottomGap
{
    NSNumber *gap = objc_getAssociatedObject(self, kUIViewLayoutMethodPropertyBottomGap);
    if (gap == nil) {
        if (@available(iOS 11, *)) {
            if (self.superview.safeAreaLayoutGuide.layoutFrame.size.height > 0) {
                gap = @((self.superview.gt_height - self.superview.safeAreaLayoutGuide.layoutFrame.origin.y - self.superview.safeAreaLayoutGuide.layoutFrame.size.height));
            } else {
                gap = nil;
            }
        } else {
            gap = @(0);
        }
        objc_setAssociatedObject(self, kUIViewLayoutMethodPropertyBottomGap, gap, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return gap.floatValue;
}

- (CGFloat)safeAreaTopGap
{
    NSNumber *gap = objc_getAssociatedObject(self, kUIViewLayoutMethodPropertyTopGap);
    if (gap == nil) {
        if (@available(iOS 11, *)) {
            gap = @(self.superview.safeAreaLayoutGuide.layoutFrame.origin.y);
        } else {
            gap = @(0);
        }
        objc_setAssociatedObject(self, kUIViewLayoutMethodPropertyTopGap, gap, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return gap.floatValue;
}

- (CGFloat)safeAreaLeftGap
{
    NSNumber *gap = objc_getAssociatedObject(self, kUIViewLayoutMethodPropertyLeftGap);
    if (gap == nil) {
        if (@available(iOS 11, *)) {
            gap = @(self.superview.safeAreaLayoutGuide.layoutFrame.origin.x);
        } else {
            gap = @(0);
        }
        objc_setAssociatedObject(self, kUIViewLayoutMethodPropertyLeftGap, gap, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return gap.floatValue;
}

- (CGFloat)safeAreaRightGap
{
    NSNumber *gap = objc_getAssociatedObject(self, kUIViewLayoutMethodPropertyRightGap);
    if (gap == nil) {
        if (@available(iOS 11, *)) {
            gap = @(self.superview.safeAreaLayoutGuide.layoutFrame.origin.x);
        } else {
            gap = @(0);
        }
        objc_setAssociatedObject(self, kUIViewLayoutMethodPropertyRightGap, gap, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return gap.floatValue;
}

@end
