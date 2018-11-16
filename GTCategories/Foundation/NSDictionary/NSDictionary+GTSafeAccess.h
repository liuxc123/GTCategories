//
//  NSDictionary+GTSafeAccess.h
//  FBSnapshotTestCase
//
//  Created by liuxc on 2018/11/16.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSDictionary (GTSafeAccess)

- (BOOL)gt_hasKey:(NSString *)key;

- (NSString*)gt_stringForKey:(id)key;

- (NSNumber*)gt_numberForKey:(id)key;

- (NSDecimalNumber *)gt_decimalNumberForKey:(id)key;

- (NSArray*)gt_arrayForKey:(id)key;

- (NSDictionary*)gt_dictionaryForKey:(id)key;

- (NSInteger)gt_integerForKey:(id)key;

- (NSUInteger)gt_unsignedIntegerForKey:(id)key;

- (BOOL)gt_boolForKey:(id)key;

- (int16_t)gt_int16ForKey:(id)key;

- (int32_t)gt_int32ForKey:(id)key;

- (int64_t)gt_int64ForKey:(id)key;

- (char)gt_charForKey:(id)key;

- (short)gt_shortForKey:(id)key;

- (float)gt_floatForKey:(id)key;

- (double)gt_doubleForKey:(id)key;

- (long long)gt_longLongForKey:(id)key;

- (unsigned long long)gt_unsignedLongLongForKey:(id)key;

- (NSDate *)gt_dateForKey:(id)key dateFormat:(NSString *)dateFormat;

//CG
- (CGFloat)gt_CGFloatForKey:(id)key;

- (CGPoint)gt_pointForKey:(id)key;

- (CGSize)gt_sizeForKey:(id)key;

- (CGRect)gt_rectForKey:(id)key;

@end

#pragma --mark NSMutableDictionary setter

@interface NSMutableDictionary(SafeAccess)

-(void)gt_setObj:(id)i forKey:(NSString*)key;

-(void)gt_setString:(NSString*)i forKey:(NSString*)key;

-(void)gt_setBool:(BOOL)i forKey:(NSString*)key;

-(void)gt_setInt:(int)i forKey:(NSString*)key;

-(void)gt_setInteger:(NSInteger)i forKey:(NSString*)key;

-(void)gt_setUnsignedInteger:(NSUInteger)i forKey:(NSString*)key;

-(void)gt_setCGFloat:(CGFloat)f forKey:(NSString*)key;

-(void)gt_setChar:(char)c forKey:(NSString*)key;

-(void)gt_setFloat:(float)i forKey:(NSString*)key;

-(void)gt_setDouble:(double)i forKey:(NSString*)key;

-(void)gt_setLongLong:(long long)i forKey:(NSString*)key;

-(void)gt_setPoint:(CGPoint)o forKey:(NSString*)key;

-(void)gt_setSize:(CGSize)o forKey:(NSString*)key;

-(void)gt_setRect:(CGRect)o forKey:(NSString*)key;

@end

