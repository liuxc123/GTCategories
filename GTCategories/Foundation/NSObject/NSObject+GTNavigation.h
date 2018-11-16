//
//  NSObject+GTNavigation.h
//  FBSnapshotTestCase
//
//  Created by liuxc on 2018/11/16.
//

#import <UIKit/UIKit.h>

@interface NSObject (GTNavigation)

- (UIViewController * _Nullable)gt_topmostViewController;
- (void)gt_pushViewController:(UIViewController * _Nonnull)viewController animated:(BOOL)animated;
- (void)gt_presentViewController:(UIViewController * _Nonnull)viewControllerToPresent animated:(BOOL)animated completion:(void (^ __nullable)(void))completion;

@end
