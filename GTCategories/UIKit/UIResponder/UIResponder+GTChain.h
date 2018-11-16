//
//  UIResponder+GTChain.h
//  FBSnapshotTestCase
//
//  Created by liuxc on 2018/11/16.
//

#import <UIKit/UIKit.h>

@interface UIResponder (GTChain)

/**
 *  @brief  响应者链
 *
 *  @return  响应者链
 */
- (NSString *)gt_responderChainDescription;

@end
