//
//  CAMediaTimingFunction+GTAdditionalEquations.h
//  FBSnapshotTestCase
//
//  Created by liuxc on 2018/11/16.
//

#import <QuartzCore/QuartzCore.h>

@interface CAMediaTimingFunction (GTAdditionalEquations)


///---------------------------------------------------------------------------------------
/// @name Circ Easing
///---------------------------------------------------------------------------------------

+(CAMediaTimingFunction *)gt_easeInCirc;
+(CAMediaTimingFunction *)gt_easeOutCirc;
+(CAMediaTimingFunction *)gt_easeInOutCirc;

///---------------------------------------------------------------------------------------
/// @name Cubic Easing
///---------------------------------------------------------------------------------------

+(CAMediaTimingFunction *)gt_easeInCubic;
+(CAMediaTimingFunction *)gt_easeOutCubic;
+(CAMediaTimingFunction *)gt_easeInOutCubic;

///---------------------------------------------------------------------------------------
/// @name Expo Easing
///---------------------------------------------------------------------------------------

+(CAMediaTimingFunction *)gt_easeInExpo;
+(CAMediaTimingFunction *)gt_easeOutExpo;
+(CAMediaTimingFunction *)gt_easeInOutExpo;

///---------------------------------------------------------------------------------------
/// @name Quad Easing
///---------------------------------------------------------------------------------------

+(CAMediaTimingFunction *)gt_easeInQuad;
+(CAMediaTimingFunction *)gt_easeOutQuad;
+(CAMediaTimingFunction *)gt_easeInOutQuad;

///---------------------------------------------------------------------------------------
/// @name Quart Easing
///---------------------------------------------------------------------------------------

+(CAMediaTimingFunction *)gt_easeInQuart;
+(CAMediaTimingFunction *)gt_easeOutQuart;
+(CAMediaTimingFunction *)gt_easeInOutQuart;

///---------------------------------------------------------------------------------------
/// @name Quint Easing
///---------------------------------------------------------------------------------------

+(CAMediaTimingFunction *)gt_easeInQuint;
+(CAMediaTimingFunction *)gt_easeOutQuint;
+(CAMediaTimingFunction *)gt_easeInOutQuint;

///---------------------------------------------------------------------------------------
/// @name Sine Easing
///---------------------------------------------------------------------------------------

+(CAMediaTimingFunction *)gt_easeInSine;
+(CAMediaTimingFunction *)gt_easeOutSine;
+(CAMediaTimingFunction *)gt_easeInOutSine;

///---------------------------------------------------------------------------------------
/// @name Back Easing
///---------------------------------------------------------------------------------------

+(CAMediaTimingFunction *)gt_easeInBack;
+(CAMediaTimingFunction *)gt_easeOutBack;
+(CAMediaTimingFunction *)gt_easeInOutBack;

@end
