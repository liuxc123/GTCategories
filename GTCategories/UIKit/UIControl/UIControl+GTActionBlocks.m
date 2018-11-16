//
//  UIControl+GTActionBlocks.m
//  FBSnapshotTestCase
//
//  Created by liuxc on 2018/11/16.
//

#import "UIControl+GTActionBlocks.h"
#import <objc/runtime.h>

static const void *UIControlGTActionBlockArray = &UIControlGTActionBlockArray;

@implementation UIControlGTActionBlockWrapper

- (void)gt_invokeBlock:(id)sender {
    if (self.gt_actionBlock) {
        self.gt_actionBlock(sender);
    }
}
@end

@implementation UIControl (GTActionBlocks)

-(void)gt_handleControlEvents:(UIControlEvents)controlEvents withBlock:(UIControlGTActionBlock)actionBlock {
    NSMutableArray *actionBlocksArray = [self gt_actionBlocksArray];

    UIControlGTActionBlockWrapper *blockActionWrapper = [[UIControlGTActionBlockWrapper alloc] init];
    blockActionWrapper.gt_actionBlock = actionBlock;
    blockActionWrapper.gt_controlEvents = controlEvents;
    [actionBlocksArray addObject:blockActionWrapper];

    [self addTarget:blockActionWrapper action:@selector(gt_invokeBlock:) forControlEvents:controlEvents];
}


- (void)gt_removeActionBlocksForControlEvents:(UIControlEvents)controlEvents {
    NSMutableArray *actionBlocksArray = [self gt_actionBlocksArray];
    NSMutableArray *wrappersToRemove = [NSMutableArray arrayWithCapacity:[actionBlocksArray count]];

    [actionBlocksArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        UIControlGTActionBlockWrapper *wrapperTmp = obj;
        if (wrapperTmp.gt_controlEvents == controlEvents) {
            [wrappersToRemove addObject:wrapperTmp];
            [self removeTarget:wrapperTmp action:@selector(gt_invokeBlock:) forControlEvents:controlEvents];
        }
    }];

    [actionBlocksArray removeObjectsInArray:wrappersToRemove];
}


- (NSMutableArray *)gt_actionBlocksArray {
    NSMutableArray *actionBlocksArray = objc_getAssociatedObject(self, UIControlGTActionBlockArray);
    if (!actionBlocksArray) {
        actionBlocksArray = [NSMutableArray array];
        objc_setAssociatedObject(self, UIControlGTActionBlockArray, actionBlocksArray, OBJC_ASSOCIATION_RETAIN);
    }
    return actionBlocksArray;
}

@end
