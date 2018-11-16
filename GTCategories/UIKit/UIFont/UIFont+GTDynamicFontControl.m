//
//  UIFont+GTDynamicFontControl.m
//  FBSnapshotTestCase
//
//  Created by liuxc on 2018/11/16.
//

#import "UIFont+GTDynamicFontControl.h"

@implementation UIFont (GTDynamicFontControl)

+(UIFont *)gt_preferredFontForTextStyle:(NSString *)style withFontName:(NSString *)fontName{
    return [UIFont gt_preferredFontForTextStyle:style withFontName:fontName scale:1.0f];
}

+(UIFont *)gt_preferredFontForTextStyle:(NSString *)style withFontName:(NSString *)fontName scale:(CGFloat)scale{


    UIFont * font = nil;
    if([[UIFont class] resolveClassMethod:@selector(preferredFontForTextStyle:)]){
        font = [UIFont preferredFontForTextStyle:fontName];
    }else{
        font = [UIFont fontWithName:fontName size:14 * scale];
    }


    return [font gt_adjustFontForTextStyle:style];

}

-(UIFont *)gt_adjustFontForTextStyle:(NSString *)style{
    return [self gt_adjustFontForTextStyle:style scale:1.0f];
}

-(UIFont *)gt_adjustFontForTextStyle:(NSString *)style scale:(CGFloat)scale{

    UIFontDescriptor * fontDescriptor = nil;

    if([[UIFont class] resolveClassMethod:@selector(preferredFontForTextStyle:)]){

        fontDescriptor = [UIFontDescriptor preferredFontDescriptorWithTextStyle:style];

    }else{

        fontDescriptor = self.fontDescriptor;

    }

    float dynamicSize = [fontDescriptor pointSize] * scale + 3;

    return [UIFont fontWithName:self.fontName size:dynamicSize];

}

@end
