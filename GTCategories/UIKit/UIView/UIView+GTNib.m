//
//  UIView+GTNib.m
//  GTCategories
//
//  Created by liuxc on 2018/11/16.
//

#import "UIView+GTNib.h"

@implementation UIView (GTNib)

#pragma mark - Nibs
+ (UINib *)gt_loadNib
{
    return [self gt_loadNibNamed:NSStringFromClass([self class])];
}
+ (UINib *)gt_loadNibNamed:(NSString*)nibName
{
    return [self gt_loadNibNamed:nibName bundle:[NSBundle mainBundle]];
}
+ (UINib *)gt_loadNibNamed:(NSString*)nibName bundle:(NSBundle *)bundle
{
    return [UINib nibWithNibName:nibName bundle:bundle];
}
+ (instancetype)gt_loadInstanceFromNib
{
    return [self gt_loadInstanceFromNibWithName:NSStringFromClass([self class])];
}
+ (instancetype)gt_loadInstanceFromNibWithName:(NSString *)nibName
{
    return [self gt_loadInstanceFromNibWithName:nibName owner:nil];
}
+ (instancetype)gt_loadInstanceFromNibWithName:(NSString *)nibName owner:(id)owner
{
    return [self gt_loadInstanceFromNibWithName:nibName owner:owner bundle:[NSBundle mainBundle]];
}
+ (instancetype)gt_loadInstanceFromNibWithName:(NSString *)nibName owner:(id)owner bundle:(NSBundle *)bundle
{
    UIView *result = nil;
    NSArray* elements = [bundle loadNibNamed:nibName owner:owner options:nil];
    for (id object in elements)
    {
        if ([object isKindOfClass:[self class]])
        {
            result = object;
            break;
        }
    }
    return result;
}

@end
