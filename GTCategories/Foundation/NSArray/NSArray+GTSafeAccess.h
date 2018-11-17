//
//  NSArray+GTSafeAccess.h
//  GTCategories
//
//  Created by liuxc on 2018/11/16.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSArray (GTSafeAccess)

-(id)gt_objectWithIndex:(NSUInteger)index;

- (NSString*)gt_stringWithIndex:(NSUInteger)index;

- (NSNumber*)gt_numberWithIndex:(NSUInteger)index;

- (NSDecimalNumber *)gt_decimalNumberWithIndex:(NSUInteger)index;

- (NSArray*)gt_arrayWithIndex:(NSUInteger)index;

- (NSDictionary*)gt_dictionaryWithIndex:(NSUInteger)index;

- (NSInteger)gt_integerWithIndex:(NSUInteger)index;

- (NSUInteger)gt_unsignedIntegerWithIndex:(NSUInteger)index;

- (BOOL)gt_boolWithIndex:(NSUInteger)index;

- (int16_t)gt_int16WithIndex:(NSUInteger)index;

- (int32_t)gt_int32WithIndex:(NSUInteger)index;

- (int64_t)gt_int64WithIndex:(NSUInteger)index;

- (char)gt_charWithIndex:(NSUInteger)index;

- (short)gt_shortWithIndex:(NSUInteger)index;

- (float)gt_floatWithIndex:(NSUInteger)index;

- (double)gt_doubleWithIndex:(NSUInteger)index;

- (NSDate *)gt_dateWithIndex:(NSUInteger)index dateFormat:(NSString *)dateFormat;
//CG
- (CGFloat)gt_CGFloatWithIndex:(NSUInteger)index;

- (CGPoint)gt_pointWithIndex:(NSUInteger)index;

- (CGSize)gt_sizeWithIndex:(NSUInteger)index;

- (CGRect)gt_rectWithIndex:(NSUInteger)index;

@end

#pragma --mark NSMutableArray setter

@interface NSMutableArray(JKSafeAccess)

-(void)gt_addObj:(id)i;

-(void)gt_addString:(NSString*)i;

-(void)gt_addBool:(BOOL)i;

-(void)gt_addInt:(int)i;

-(void)gt_addInteger:(NSInteger)i;

-(void)gt_addUnsignedInteger:(NSUInteger)i;

-(void)gt_addCGFloat:(CGFloat)f;

-(void)gt_addChar:(char)c;

-(void)gt_addFloat:(float)i;

-(void)gt_addPoint:(CGPoint)o;

-(void)gt_addSize:(CGSize)o;

-(void)gt_addRect:(CGRect)o;

@end
