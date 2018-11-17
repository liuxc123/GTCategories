//
//  UIViewController+GTRecursiveDescription.h
//  GTCategories
//
//  Created by liuxc on 2018/11/16.
//

#import <UIKit/UIKit.h>

@interface UIViewController (GTRecursiveDescription)

/**
 *  @brief  视图层级
 *
 *  @return 视图层级字符串
 */
-(NSString*)gt_recursiveDescription;

@end
