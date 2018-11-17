//
//  UIWindow+GTHierarchy.h
//  GTCategories
//
//  Created by liuxc on 2018/11/16.
//

#import <UIKit/UIKit.h>

@interface UIWindow (GTHierarchy)

/*!
 @method topMostController

 @return Returns the current Top Most ViewController in hierarchy.
 */
- (UIViewController*)gt_topMostController;

/*!
 @method currentViewController

 @return Returns the topViewController in stack of topMostController.
 */
- (UIViewController*)gt_currentViewController;

@end
