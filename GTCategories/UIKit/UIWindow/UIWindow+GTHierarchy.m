//
//  UIWindow+GTHierarchy.m
//  GTCategories
//
//  Created by liuxc on 2018/11/16.
//

#import "UIWindow+GTHierarchy.h"

@implementation UIWindow (GTHierarchy)

- (UIViewController*)gt_topMostController
{
    UIViewController *topController = [self rootViewController];

    //  Getting topMost ViewController
    while ([topController presentedViewController]) topController = [topController presentedViewController];

    //  Returning topMost ViewController
    return topController;
}

- (UIViewController*)gt_currentViewController;
{
    UIViewController *currentViewController = [self gt_topMostController];

    while ([currentViewController isKindOfClass:[UINavigationController class]] && [(UINavigationController*)currentViewController topViewController])
        currentViewController = [(UINavigationController*)currentViewController topViewController];

    return currentViewController;
}

@end
