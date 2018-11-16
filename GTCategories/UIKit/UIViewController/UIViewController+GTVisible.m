//
//  UIViewController+GTVisible.m
//  FBSnapshotTestCase
//
//  Created by liuxc on 2018/11/16.
//

#import "UIViewController+GTVisible.h"

@implementation UIViewController (GTVisible)

- (BOOL)gt_isVisible {
    return [self isViewLoaded] && self.view.window;
}

@end
