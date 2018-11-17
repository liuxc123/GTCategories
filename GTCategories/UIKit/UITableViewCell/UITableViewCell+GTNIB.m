//
//  UITableViewCell+GTNIB.m
//  GTCategories
//
//  Created by liuxc on 2018/11/16.
//

#import "UITableViewCell+GTNIB.h"

@implementation UITableViewCell (GTNIB)

/**
 *  @brief  加载同类名的nib
 *
 *  @return nib
 */
+(UINib*)gt_nib{
    return  [UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil];
}


@end
