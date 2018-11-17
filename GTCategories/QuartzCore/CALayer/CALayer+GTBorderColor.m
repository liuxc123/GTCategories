//
//  CALayer+GTBorderColor.m
//  GTCategories
//
//  Created by liuxc on 2018/11/16.
//

#import "CALayer+GTBorderColor.h"

@implementation CALayer (GTBorderColor)

-(void)setGt_borderColor:(UIColor *)gt_borderColor{
    self.borderColor = gt_borderColor.CGColor;
}

- (UIColor*)gt_borderColor {
    return [UIColor colorWithCGColor:self.borderColor];
}

@end
