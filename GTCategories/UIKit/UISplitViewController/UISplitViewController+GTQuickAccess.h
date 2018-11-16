//
//  UISplitViewController+GTQuickAccess.h
//  FBSnapshotTestCase
//
//  Created by liuxc on 2018/11/16.
//

#import <UIKit/UIKit.h>

/*
 I often want the "left content view controller" or the "right content view controller".
 Many times the UIViewControllers in viewControllers are actually UINavigationControllers and then
 I want to get the topViewController from that. So these methods pull the left or right VC and then
 check if they are UINavigationControllers. If they are then they go ahead and return the controller's
 topViewController property.
 */

@interface UISplitViewController (GTQuickAccess)

@property (weak, readonly, nonatomic) UIViewController *gt_leftController;
@property (weak, readonly, nonatomic) UIViewController *gt_rightController;

@end
