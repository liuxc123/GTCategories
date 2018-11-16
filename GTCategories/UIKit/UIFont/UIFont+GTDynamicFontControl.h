//
//  UIFont+GTDynamicFontControl.h
//  FBSnapshotTestCase
//
//  Created by liuxc on 2018/11/16.
//

#import <UIKit/UIKit.h>

@interface UIFont (GTDynamicFontControl)


+(UIFont *)gt_preferredFontForTextStyle:(NSString *)style withFontName:(NSString *)fontName scale:(CGFloat)scale;

+(UIFont *)gt_preferredFontForTextStyle:(NSString *)style withFontName:(NSString *)fontName;



-(UIFont *)gt_adjustFontForTextStyle:(NSString *)style;

-(UIFont *)gt_adjustFontForTextStyle:(NSString *)style scale:(CGFloat)scale;

@end
