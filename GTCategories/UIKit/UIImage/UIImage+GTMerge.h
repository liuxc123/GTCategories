//
//  UIImage+GTMerge.h
//  FBSnapshotTestCase
//
//  Created by liuxc on 2018/11/16.
//

#import <UIKit/UIKit.h>

@interface UIImage (GTMerge)

/**
 *  @brief  合并两个图片
 *
 *  @param firstImage  一个图片
 *  @param secondImage 二个图片
 *
 *  @return 合并后图片
 */
+ (UIImage*)gt_mergeImage:(UIImage*)firstImage withImage:(UIImage*)secondImage;

@end
