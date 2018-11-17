//
//  UISplitViewController+GTQuickAccess.m
//  GTCategories
//
//  Created by liuxc on 2018/11/16.
//

#import "UISplitViewController+GTQuickAccess.h"

@implementation UISplitViewController (GTQuickAccess)

- (UIViewController *)gt_leftController {
    UIViewController * leftVC = [[self viewControllers] objectAtIndex:0];

    if ([leftVC isKindOfClass:[UINavigationController class]]) {
        leftVC = [(UINavigationController *)leftVC topViewController];
    }
    return  leftVC;
}

- (UIViewController *)gt_rightController {
    UIViewController * rightVC = [[self viewControllers] lastObject];

    if ([rightVC isKindOfClass:[UINavigationController class]]) {
        rightVC = [(UINavigationController *)rightVC topViewController];
    }
    return rightVC;
}

@end
