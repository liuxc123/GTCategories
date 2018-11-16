//
//  UIImage+GTRemoteSize.h
//  FBSnapshotTestCase
//
//  Created by liuxc on 2018/11/16.
//

#import <UIKit/UIKit.h>

typedef void (^GTUIImageSizeRequestCompleted) (NSURL* imgURL, CGSize size);

@interface UIImage (GTRemoteSize)

/**
 *  @brief 获取远程图片的大小
 *
 *  @param imgURL     图片url
 *  @param completion 完成回调
 */
+ (void)gt_requestSizeNoHeader:(NSURL*)imgURL completion:(GTUIImageSizeRequestCompleted)completion;

@end
