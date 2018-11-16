//
//  NSDictionary+GTURL.h
//  FBSnapshotTestCase
//
//  Created by liuxc on 2018/11/16.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (GTURL)

/**
 *  @brief  将url参数转换成NSDictionary
 *
 *  @param query url参数
 *
 *  @return NSDictionary
 */
+ (NSDictionary *)gt_dictionaryWithURLQuery:(NSString *)query;
/**
 *  @brief  将NSDictionary转换成url 参数字符串
 *
 *  @return url 参数字符串
 */
- (NSString *)gt_URLQueryString;

@end
