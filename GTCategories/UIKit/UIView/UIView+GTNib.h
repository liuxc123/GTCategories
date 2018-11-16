//
//  UIView+GTNib.h
//  FBSnapshotTestCase
//
//  Created by liuxc on 2018/11/16.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface UIView (GTNib)

+ (UINib *)gt_loadNib;
+ (UINib *)gt_loadNibNamed:(NSString*)nibName;
+ (UINib *)gt_loadNibNamed:(NSString*)nibName bundle:(NSBundle *)bundle;

+ (instancetype)gt_loadInstanceFromNib;
+ (instancetype)gt_loadInstanceFromNibWithName:(NSString *)nibName;
+ (instancetype)gt_loadInstanceFromNibWithName:(NSString *)nibName owner:(id)owner;
+ (instancetype)gt_loadInstanceFromNibWithName:(NSString *)nibName owner:(id)owner bundle:(NSBundle *)bundle;

@end
