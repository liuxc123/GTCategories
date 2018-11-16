//
//  CAMediaTimingFunction+GTAdditionalEquations.m
//  FBSnapshotTestCase
//
//  Created by liuxc on 2018/11/16.
//

#import "CAMediaTimingFunction+GTAdditionalEquations.h"

@implementation CAMediaTimingFunction (GTAdditionalEquations)

///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark - Circ

+(CAMediaTimingFunction *)gt_easeInCirc
{
    return [CAMediaTimingFunction functionWithControlPoints: 0.6 : 0.04 : 0.98 : 0.335];
}

///////////////////////////////////////////////////////////////////////////////////////////////////

+(CAMediaTimingFunction *)gt_easeOutCirc
{
    return [CAMediaTimingFunction functionWithControlPoints: 0.075 : 0.82 : 0.165 : 1.0];
}

///////////////////////////////////////////////////////////////////////////////////////////////////

+(CAMediaTimingFunction *)gt_easeInOutCirc
{
    return [CAMediaTimingFunction functionWithControlPoints: 0.785 : 0.135 : 0.15 : 0.86];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark - Cubic

+(CAMediaTimingFunction *)gt_easeInCubic
{
    return [CAMediaTimingFunction functionWithControlPoints: 0.55 : 0.055 : 0.675 : 0.19];
}

///////////////////////////////////////////////////////////////////////////////////////////////////

+(CAMediaTimingFunction *)gt_easeOutCubic
{
    return [CAMediaTimingFunction functionWithControlPoints: 0.215 : 0.61 : 0.355 : 1.0];
}

///////////////////////////////////////////////////////////////////////////////////////////////////

+(CAMediaTimingFunction *)gt_easeInOutCubic
{
    return [CAMediaTimingFunction functionWithControlPoints: 0.645 : 0.045 : 0.355 : 1.0];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark - Expo

+(CAMediaTimingFunction *)gt_easeInExpo
{
    return [CAMediaTimingFunction functionWithControlPoints: 0.95 : 0.05 : 0.795 : 0.035];
}

///////////////////////////////////////////////////////////////////////////////////////////////////

+(CAMediaTimingFunction *)gt_easeOutExpo
{
    return [CAMediaTimingFunction functionWithControlPoints: 0.19 : 1.0 : 0.22 : 1.0];
}

///////////////////////////////////////////////////////////////////////////////////////////////////

+(CAMediaTimingFunction *)gt_easeInOutExpo
{
    return [CAMediaTimingFunction functionWithControlPoints: 1.0 : 0.0 : 0.0 : 1.0];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark - Quad

+(CAMediaTimingFunction *)gt_easeInQuad
{
    return [CAMediaTimingFunction functionWithControlPoints: 0.55 : 0.085 : 0.68 : 0.53];
}

///////////////////////////////////////////////////////////////////////////////////////////////////

+(CAMediaTimingFunction *)gt_easeOutQuad
{
    return [CAMediaTimingFunction functionWithControlPoints: 0.25 : 0.46 : 0.45 : 0.94];
}

///////////////////////////////////////////////////////////////////////////////////////////////////

+(CAMediaTimingFunction *)gt_easeInOutQuad
{
    return [CAMediaTimingFunction functionWithControlPoints: 0.455 : 0.03 : 0.515 : 0.955];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark - Quart

+(CAMediaTimingFunction *)gt_easeInQuart
{
    return [CAMediaTimingFunction functionWithControlPoints: 0.895 : 0.03 : 0.685 : 0.22];
}

///////////////////////////////////////////////////////////////////////////////////////////////////

+(CAMediaTimingFunction *)gt_easeOutQuart
{
    return [CAMediaTimingFunction functionWithControlPoints: 0.165 : 0.84 : 0.44 : 1.0];
}

///////////////////////////////////////////////////////////////////////////////////////////////////

+(CAMediaTimingFunction *)gt_easeInOutQuart
{
    return [CAMediaTimingFunction functionWithControlPoints: 0.77 : 0.0 : 0.175 : 1.0];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark - Quint

+(CAMediaTimingFunction *)gt_easeInQuint
{
    return [CAMediaTimingFunction functionWithControlPoints: 0.755 : 0.05 : 0.855 : 0.06];
}

///////////////////////////////////////////////////////////////////////////////////////////////////

+(CAMediaTimingFunction *)gt_easeOutQuint
{
    return [CAMediaTimingFunction functionWithControlPoints: 0.23 : 1.0 : 0.320 : 1.0];
}

///////////////////////////////////////////////////////////////////////////////////////////////////

+(CAMediaTimingFunction *)gt_easeInOutQuint
{
    return [CAMediaTimingFunction functionWithControlPoints: 0.86 : 0.0 : 0.07 : 1.0];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark - Sine

+(CAMediaTimingFunction *)gt_easeInSine
{
    return [CAMediaTimingFunction functionWithControlPoints: 0.47 : 0.0 : 0.745 : 0.715];
}

///////////////////////////////////////////////////////////////////////////////////////////////////

+(CAMediaTimingFunction *)gt_easeOutSine
{
    return [CAMediaTimingFunction functionWithControlPoints: 0.39 : 0.575 : 0.565 : 1.0];
}

///////////////////////////////////////////////////////////////////////////////////////////////////

+(CAMediaTimingFunction *)gt_easeInOutSine
{
    return [CAMediaTimingFunction functionWithControlPoints: 0.445 : 0.05 : 0.55 : 0.95];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark - Back

+(CAMediaTimingFunction *)gt_easeInBack
{
    return [CAMediaTimingFunction functionWithControlPoints: 0.6 : -0.28 : 0.735 : 0.045];
}

///////////////////////////////////////////////////////////////////////////////////////////////////

+(CAMediaTimingFunction *)gt_easeOutBack
{
    return [CAMediaTimingFunction functionWithControlPoints: 0.175 : 0.885 : 0.320 : 1.275];
}

///////////////////////////////////////////////////////////////////////////////////////////////////

+(CAMediaTimingFunction *)gt_easeInOutBack
{
    return [CAMediaTimingFunction functionWithControlPoints: 0.68 : -0.55 : 0.265 : 1.55];
}

@end