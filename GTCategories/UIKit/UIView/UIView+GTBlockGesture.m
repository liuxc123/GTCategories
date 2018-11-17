//
//  UIView+GTBlockGesture.m
//  GTCategories
//
//  Created by liuxc on 2018/11/16.
//

#import "UIView+GTBlockGesture.h"
#import <objc/runtime.h>
static char gt_kActionHandlerTapBlockKey;
static char gt_kActionHandlerTapGestureKey;
static char gt_kActionHandlerLongPressBlockKey;
static char gt_kActionHandlerLongPressGestureKey;

@implementation UIView (GTBlockGesture)

- (void)gt_addTapActionWithBlock:(GTGestureActionBlock)block
{
    UITapGestureRecognizer *gesture = objc_getAssociatedObject(self, &gt_kActionHandlerTapGestureKey);
    if (!gesture)
    {
        gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gt_handleActionForTapGesture:)];
        [self addGestureRecognizer:gesture];
        objc_setAssociatedObject(self, &gt_kActionHandlerTapGestureKey, gesture, OBJC_ASSOCIATION_RETAIN);
    }
    objc_setAssociatedObject(self, &gt_kActionHandlerTapBlockKey, block, OBJC_ASSOCIATION_COPY);
}
- (void)gt_handleActionForTapGesture:(UITapGestureRecognizer*)gesture
{
    if (gesture.state == UIGestureRecognizerStateRecognized)
    {
        GTGestureActionBlock block = objc_getAssociatedObject(self, &gt_kActionHandlerTapBlockKey);
        if (block)
        {
            block(gesture);
        }
    }
}
- (void)gt_addLongPressActionWithBlock:(GTGestureActionBlock)block
{
    UILongPressGestureRecognizer *gesture = objc_getAssociatedObject(self, &gt_kActionHandlerLongPressGestureKey);
    if (!gesture)
    {
        gesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(gt_handleActionForLongPressGesture:)];
        [self addGestureRecognizer:gesture];
        objc_setAssociatedObject(self, &gt_kActionHandlerLongPressGestureKey, gesture, OBJC_ASSOCIATION_RETAIN);
    }
    objc_setAssociatedObject(self, &gt_kActionHandlerLongPressBlockKey, block, OBJC_ASSOCIATION_COPY);
}
- (void)gt_handleActionForLongPressGesture:(UITapGestureRecognizer*)gesture
{
    if (gesture.state == UIGestureRecognizerStateRecognized)
    {
        GTGestureActionBlock block = objc_getAssociatedObject(self, &gt_kActionHandlerLongPressBlockKey);
        if (block)
        {
            block(gesture);
        }
    }
}

@end
