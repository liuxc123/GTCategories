//
//  UIViewController+GTBlockSegue.h
//  GTCategories
//
//  Created by liuxc on 2018/11/16.
//
//https://github.com/patoroco/UIViewController-BlockSegue


#import <UIKit/UIKit.h>

typedef void (^UIViewControllerGTSegueBlock) (id sender, id destinationVC, UIStoryboardSegue *segue);

@interface UIViewController (GTBlockSegue)

-(void)gt_configureSegue:(NSString *)identifier withBlock:(UIViewControllerGTSegueBlock)block;
-(void)gt_performSegueWithIdentifier:(NSString *)identifier sender:(id)sender withBlock:(UIViewControllerGTSegueBlock)block;

@end
