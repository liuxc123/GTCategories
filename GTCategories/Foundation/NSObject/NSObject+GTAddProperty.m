//
//  NSObject+GTAddProperty.m
//  GTCategories
//
//  Created by liuxc on 2018/11/16.
//

#import "NSObject+GTAddProperty.h"
#import <objc/runtime.h>

//objc_getAssociatedObject和objc_setAssociatedObject都需要指定一个固定的地址，这个固定的地址值用来表示属性的key，起到一个常量的作用。
static const void *GTStringProperty = &GTStringProperty;
static const void *GTIntegerProperty = &GTIntegerProperty;
//static char IntegerProperty;
@implementation NSObject (GTAddProperty)

@dynamic gt_stringProperty;
@dynamic gt_integerProperty;

//set
/**
 *  @brief  catgory runtime实现get set方法增加一个字符串属性
 */
-(void)setgt_stringProperty:(NSString *)gt_stringProperty{
    //use that a static const as the key
    objc_setAssociatedObject(self, GTStringProperty, gt_stringProperty, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    //use that property's selector as the key:
    //objc_setAssociatedObject(self, @selector(stringProperty), stringProperty, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
//get
-(NSString *)gt_stringProperty{
    return objc_getAssociatedObject(self, GTStringProperty);
}

//set
/**
 *  @brief  catgory runtime实现get set方法增加一个NSInteger属性
 */
-(void)setgt_integerProperty:(NSInteger)gt_integerProperty{
    NSNumber *number = [[NSNumber alloc]initWithInteger:gt_integerProperty];
    objc_setAssociatedObject(self,GTIntegerProperty, number, OBJC_ASSOCIATION_ASSIGN);
}
//get
-(NSInteger)gt_integerProperty{
    return [objc_getAssociatedObject(self, GTIntegerProperty) integerValue];
}

@end
