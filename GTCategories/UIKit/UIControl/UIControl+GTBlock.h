//
//  UIControl+GTBlock.h
//  GTCategories
//
//  Created by liuxc on 2018/11/16.
//

#import <UIKit/UIKit.h>

@interface UIControl (GTBlock)

- (void)gt_touchDown:(void (^)(void))eventBlock;
- (void)gt_touchDownRepeat:(void (^)(void))eventBlock;
- (void)gt_touchDragInside:(void (^)(void))eventBlock;
- (void)gt_touchDragOutside:(void (^)(void))eventBlock;
- (void)gt_touchDragEnter:(void (^)(void))eventBlock;
- (void)gt_touchDragExit:(void (^)(void))eventBlock;
- (void)gt_touchUpInside:(void (^)(void))eventBlock;
- (void)gt_touchUpOutside:(void (^)(void))eventBlock;
- (void)gt_touchCancel:(void (^)(void))eventBlock;
- (void)gt_valueChanged:(void (^)(void))eventBlock;
- (void)gt_editingDidBegin:(void (^)(void))eventBlock;
- (void)gt_editingChanged:(void (^)(void))eventBlock;
- (void)gt_editingDidEnd:(void (^)(void))eventBlock;
- (void)gt_editingDidEndOnExit:(void (^)(void))eventBlock;

@end
