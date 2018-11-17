//
//  NSData+GTAPNSToken.m
//  GTCategories
//
//  Created by liuxc on 2018/11/16.
//

#import "NSData+GTAPNSToken.h"

@implementation NSData (GTAPNSToken)

/**
 *  @brief  将APNS NSData类型token 格式化成字符串
 *
 *  @return 字符串token
 */
- (NSString *)gt_APNSToken {
    return [[[[self description]
              stringByReplacingOccurrencesOfString: @"<" withString: @""]
             stringByReplacingOccurrencesOfString: @">" withString: @""]
            stringByReplacingOccurrencesOfString: @" " withString: @""];
}

@end
