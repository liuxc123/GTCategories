//
//  UIView+GTBlockGesture.h
//  FBSnapshotTestCase
//
//  Created by liuxc on 2018/11/16.
//

#import <UIKit/UIKit.h>

typedef void (^GTGestureActionBlock)(UIGestureRecognizer *gestureRecoginzer);

@interface UIView (GTBlockGesture)

/**
 *  @brief  添加tap手势
 *
 *  @param block 代码块
 */
- (void)gt_addTapActionWithBlock:(GTGestureActionBlock)block;
/**
 *  @brief  添加长按手势
 *
 *  @param block 代码块
 */
- (void)gt_addLongPressActionWithBlock:(GTGestureActionBlock)block;

@end
