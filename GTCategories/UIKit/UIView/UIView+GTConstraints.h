//
//  UIView+GTConstraints.h
//  FBSnapshotTestCase
//
//  Created by liuxc on 2018/11/16.
//

#import <UIKit/UIKit.h>

@interface UIView (GTConstraints)

- (NSLayoutConstraint *)gt_constraintForAttribute:(NSLayoutAttribute)attribute;

- (NSLayoutConstraint *)gt_leftConstraint;
- (NSLayoutConstraint *)gt_rightConstraint;
- (NSLayoutConstraint *)gt_topConstraint;
- (NSLayoutConstraint *)gt_bottomConstraint;
- (NSLayoutConstraint *)gt_leadingConstraint;
- (NSLayoutConstraint *)gt_trailingConstraint;
- (NSLayoutConstraint *)gt_widthConstraint;
- (NSLayoutConstraint *)gt_heightConstraint;
- (NSLayoutConstraint *)gt_centerXConstraint;
- (NSLayoutConstraint *)gt_centerYConstraint;
- (NSLayoutConstraint *)gt_baseLineConstraint;

@end
