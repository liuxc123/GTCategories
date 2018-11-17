//
//  UIView+GTScreenshot.h
//  GTCategories
//
//  Created by liuxc on 2018/11/16.
//

#import <UIKit/UIKit.h>

@interface UIView (GTScreenshot)

/**
 *  @brief  view截图
 *
 *  @return 截图
 */
- (UIImage *)gt_screenshot;

/**
 *  @author Jakey
 *
 *  @brief  截图一个view中所有视图 包括旋转缩放效果
 *
 *  @param maxWidth 限制缩放的最大宽度 保持默认传0
 *
 *  @return 截图
 */
- (UIImage *)gt_screenshot:(CGFloat)maxWidth;

@end
