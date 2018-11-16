//
//  NSArray+GTSafeAccess.m
//  FBSnapshotTestCase
//
//  Created by liuxc on 2018/11/16.
//

#import "NSArray+GTSafeAccess.h"

@implementation NSArray (GTSafeAccess)

-(id)gt_objectWithIndex:(NSUInteger)index{
    if (index <self.count) {
        return self[index];
    }else{
        return nil;
    }
}

- (NSString*)gt_stringWithIndex:(NSUInteger)index
{
    id value = [self gt_objectWithIndex:index];
    if (value == nil || value == [NSNull null] || [[value description] isEqualToString:@"<null>"])
    {
        return nil;
    }
    if ([value isKindOfClass:[NSString class]]) {
        return (NSString*)value;
    }
    if ([value isKindOfClass:[NSNumber class]]) {
        return [value stringValue];
    }

    return nil;
}


- (NSNumber*)gt_numberWithIndex:(NSUInteger)index
{
    id value = [self gt_objectWithIndex:index];
    if ([value isKindOfClass:[NSNumber class]]) {
        return (NSNumber*)value;
    }
    if ([value isKindOfClass:[NSString class]]) {
        NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
        [f setNumberStyle:NSNumberFormatterDecimalStyle];
        return [f numberFromString:(NSString*)value];
    }
    return nil;
}

- (NSDecimalNumber *)gt_decimalNumberWithIndex:(NSUInteger)index{
    id value = [self gt_objectWithIndex:index];

    if ([value isKindOfClass:[NSDecimalNumber class]]) {
        return value;
    } else if ([value isKindOfClass:[NSNumber class]]) {
        NSNumber * number = (NSNumber*)value;
        return [NSDecimalNumber decimalNumberWithDecimal:[number decimalValue]];
    } else if ([value isKindOfClass:[NSString class]]) {
        NSString * str = (NSString*)value;
        return [str isEqualToString:@""] ? nil : [NSDecimalNumber decimalNumberWithString:str];
    }
    return nil;
}

- (NSArray*)gt_arrayWithIndex:(NSUInteger)index
{
    id value = [self gt_objectWithIndex:index];
    if (value == nil || value == [NSNull null])
    {
        return nil;
    }
    if ([value isKindOfClass:[NSArray class]])
    {
        return value;
    }
    return nil;
}


- (NSDictionary*)gt_dictionaryWithIndex:(NSUInteger)index
{
    id value = [self gt_objectWithIndex:index];
    if (value == nil || value == [NSNull null])
    {
        return nil;
    }
    if ([value isKindOfClass:[NSDictionary class]])
    {
        return value;
    }
    return nil;
}

- (NSInteger)gt_integerWithIndex:(NSUInteger)index
{
    id value = [self gt_objectWithIndex:index];
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSString class]] || [value isKindOfClass:[NSNumber class]])
    {
        return [value integerValue];
    }
    return 0;
}
- (NSUInteger)gt_unsignedIntegerWithIndex:(NSUInteger)index
{
    id value = [self gt_objectWithIndex:index];
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSString class]] || [value isKindOfClass:[NSNumber class]])
    {
        return [value unsignedIntegerValue];
    }
    return 0;
}
- (BOOL)gt_boolWithIndex:(NSUInteger)index
{
    id value = [self gt_objectWithIndex:index];

    if (value == nil || value == [NSNull null])
    {
        return NO;
    }
    if ([value isKindOfClass:[NSNumber class]])
    {
        return [value boolValue];
    }
    if ([value isKindOfClass:[NSString class]])
    {
        return [value boolValue];
    }
    return NO;
}
- (int16_t)gt_int16WithIndex:(NSUInteger)index
{
    id value = [self gt_objectWithIndex:index];

    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]])
    {
        return [value shortValue];
    }
    if ([value isKindOfClass:[NSString class]])
    {
        return [value intValue];
    }
    return 0;
}
- (int32_t)gt_int32WithIndex:(NSUInteger)index
{
    id value = [self gt_objectWithIndex:index];

    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]])
    {
        return [value intValue];
    }
    return 0;
}
- (int64_t)gt_int64WithIndex:(NSUInteger)index
{
    id value = [self gt_objectWithIndex:index];

    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]])
    {
        return [value longLongValue];
    }
    return 0;
}

- (char)gt_charWithIndex:(NSUInteger)index{

    id value = [self gt_objectWithIndex:index];

    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]])
    {
        return [value charValue];
    }
    return 0;
}

- (short)gt_shortWithIndex:(NSUInteger)index
{
    id value = [self gt_objectWithIndex:index];

    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]])
    {
        return [value shortValue];
    }
    if ([value isKindOfClass:[NSString class]])
    {
        return [value intValue];
    }
    return 0;
}
- (float)gt_floatWithIndex:(NSUInteger)index
{
    id value = [self gt_objectWithIndex:index];

    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]])
    {
        return [value floatValue];
    }
    return 0;
}
- (double)gt_doubleWithIndex:(NSUInteger)index
{
    id value = [self gt_objectWithIndex:index];

    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]])
    {
        return [value doubleValue];
    }
    return 0;
}

- (NSDate *)gt_dateWithIndex:(NSUInteger)index dateFormat:(NSString *)dateFormat {
    NSDateFormatter *formater = [[NSDateFormatter alloc]init];
    formater.dateFormat = dateFormat;
    id value = [self gt_objectWithIndex:index];

    if (value == nil || value == [NSNull null])
    {
        return nil;
    }

    if ([value isKindOfClass:[NSString class]] && ![value isEqualToString:@""] && !dateFormat) {
        return [formater dateFromString:value];
    }
    return nil;
}

//CG
- (CGFloat)gt_CGFloatWithIndex:(NSUInteger)index
{
    id value = [self gt_objectWithIndex:index];

    CGFloat f = [value doubleValue];

    return f;
}

- (CGPoint)gt_pointWithIndex:(NSUInteger)index
{
    id value = [self gt_objectWithIndex:index];

    CGPoint point = CGPointFromString(value);

    return point;
}
- (CGSize)gt_sizeWithIndex:(NSUInteger)index
{
    id value = [self gt_objectWithIndex:index];

    CGSize size = CGSizeFromString(value);

    return size;
}
- (CGRect)gt_rectWithIndex:(NSUInteger)index
{
    id value = [self gt_objectWithIndex:index];

    CGRect rect = CGRectFromString(value);

    return rect;
}

@end

#pragma --mark NSMutableArray setter

@implementation NSMutableArray (JKSafeAccess)

-(void)gt_addObj:(id)i{
    if (i!=nil) {
        [self addObject:i];
    }
}
-(void)gt_addString:(NSString*)i
{
    if (i!=nil) {
        [self addObject:i];
    }
}
-(void)gt_addBool:(BOOL)i
{
    [self addObject:@(i)];
}
-(void)gt_addInt:(int)i
{
    [self addObject:@(i)];
}
-(void)gt_addInteger:(NSInteger)i
{
    [self addObject:@(i)];
}
-(void)gt_addUnsignedInteger:(NSUInteger)i
{
    [self addObject:@(i)];
}
-(void)gt_addCGFloat:(CGFloat)f
{
    [self addObject:@(f)];
}
-(void)gt_addChar:(char)c
{
    [self addObject:@(c)];
}
-(void)gt_addFloat:(float)i
{
    [self addObject:@(i)];
}
-(void)gt_addPoint:(CGPoint)o
{
    [self addObject:NSStringFromCGPoint(o)];
}
-(void)gt_addSize:(CGSize)o
{
    [self addObject:NSStringFromCGSize(o)];
}
-(void)gt_addRect:(CGRect)o
{
    [self addObject:NSStringFromCGRect(o)];
}

@end

