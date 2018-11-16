//
//  NSObject+GTAssociatedObject.m
//  FBSnapshotTestCase
//
//  Created by liuxc on 2018/11/16.
//

#import "NSObject+GTAssociatedObject.h"
#import  <objc/runtime.h>

@implementation NSObject (GTAssociatedObject)

/**
 *  @brief  附加一个stong对象
 *
 *  @param value 被附加的对象
 *  @param key   被附加对象的key
 */
- (void)gt_associateValue:(id)value withKey:(void *)key
{
    objc_setAssociatedObject(self, key, value, OBJC_ASSOCIATION_RETAIN);
}
/**
 *  @brief  附加一个weak对象
 *
 *  @param value 被附加的对象
 *  @param key   被附加对象的key
 */
- (void)gt_weaklyAssociateValue:(id)value withKey:(void *)key
{
    objc_setAssociatedObject(self, key, value, OBJC_ASSOCIATION_ASSIGN);
}
/**
 *  @brief  根据附加对象的key取出附加对象
 *
 *  @param key 附加对象的key
 *
 *  @return 附加对象
 */
- (id)gt_associatedValueForKey:(void *)key
{
    return objc_getAssociatedObject(self, key);
}

@end
