//
//  UIImage+GTFileName.h
//  FBSnapshotTestCase
//
//  Created by liuxc on 2018/11/16.
//

#import <UIKit/UIKit.h>

@interface UIImage (GTFileName)

/**
 *  @brief  根据main bundle中的文件名读取图片
 *
 *  @param name 图片名
 *
 *  @return 无缓存的图片
 */
+ (UIImage *)gt_imageWithFileName:(NSString *)name;
/**
 *  @author JKCategories
 *
 *  根据指定bundle中的文件名读取图片
 *
 *  @param name   图片名
 *  @param bundle bundle
 *
 *  @return 无缓存的图片
 */
+ (UIImage *)gt_imageWithFileName:(NSString *)name inBundle:(NSBundle*)bundle;

@end
