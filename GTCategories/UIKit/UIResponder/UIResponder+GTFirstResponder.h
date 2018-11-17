//
//  UIResponder+GTFirstResponder.h
//  GTCategories
//
//  Created by liuxc on 2018/11/16.
//

#import <UIKit/UIKit.h>

@interface UIResponder (GTFirstResponder)

/**
 *  @brief  当前第一响应者
 *
 *  @return 当前第一响应者
 */
+ (id)gt_currentFirstResponder;

@end
