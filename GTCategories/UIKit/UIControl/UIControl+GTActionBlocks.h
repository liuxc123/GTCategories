//
//  UIControl+GTActionBlocks.h
//  FBSnapshotTestCase
//
//  Created by liuxc on 2018/11/16.
//

#import <UIKit/UIKit.h>

typedef void (^UIControlGTActionBlock)(id weakSender);

@interface UIControlGTActionBlockWrapper : NSObject
@property (nonatomic, copy) UIControlGTActionBlock gt_actionBlock;
@property (nonatomic, assign) UIControlEvents gt_controlEvents;
- (void)gt_invokeBlock:(id)sender;
@end


@interface UIControl (GTActionBlocks)

- (void)gt_handleControlEvents:(UIControlEvents)controlEvents withBlock:(UIControlGTActionBlock)actionBlock;
- (void)gt_removeActionBlocksForControlEvents:(UIControlEvents)controlEvents;

@end
