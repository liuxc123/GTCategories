//
//  UIViewController+GTRecursiveDescription.m
//  GTCategories
//
//  Created by liuxc on 2018/11/16.
//

#import "UIViewController+GTRecursiveDescription.h"

@implementation UIViewController (GTRecursiveDescription)
/**
 *  @brief  视图层级
 *
 *  @return 视图层级字符串
 */
-(NSString*)gt_recursiveDescription
{
    NSMutableString *description = [NSMutableString stringWithFormat:@"\n"];
    [self gt_addDescriptionToString:description indentLevel:0];
    return description;
}

-(void)gt_addDescriptionToString:(NSMutableString*)string indentLevel:(NSInteger)indentLevel
{
    NSString *padding = [@"" stringByPaddingToLength:indentLevel withString:@" " startingAtIndex:0];
    [string appendString:padding];
    [string appendFormat:@"%@, %@",[self debugDescription],NSStringFromCGRect(self.view.frame)];

    for (UIViewController *childController in self.childViewControllers)
    {
        [string appendFormat:@"\n%@>",padding];
        [childController gt_addDescriptionToString:string indentLevel:indentLevel + 1];
    }
}
@end
