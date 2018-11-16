//
//  NSObject+GTRuntime.h
//  FBSnapshotTestCase
//
//  Created by liuxc on 2018/11/16.
//

#import <Foundation/Foundation.h>

@interface NSObject (GTRuntime)

/**
 Exchange methods' implementations.

 @param originalMethod Method to exchange.
 @param newMethod Method to exchange.
 */
+ (void)gt_swizzleMethod:(SEL)originalMethod withMethod:(SEL)newMethod;

/**
 Append a new method to an object.

 @param newMethod Method to exchange.
 @param klass Host class.
 */
+ (void)gt_appendMethod:(SEL)newMethod fromClass:(Class)klass;

/**
 Replace a method in an object.

 @param method Method to exchange.
 @param klass Host class.
 */
+ (void)gt_replaceMethod:(SEL)method fromClass:(Class)klass;

/**
 Check whether the receiver implements or inherits a specified method up to and exluding a particular class in hierarchy.

 @param selector A selector that identifies a method.
 @param stopClass A final super class to stop quering (excluding it).
 @return YES if one of super classes in hierarchy responds a specified selector.
 */
- (BOOL)gt_respondsToSelector:(SEL)selector untilClass:(Class)stopClass;

/**
 Check whether a superclass implements or inherits a specified method.

 @param selector A selector that identifies a method.
 @return YES if one of super classes in hierarchy responds a specified selector.
 */
- (BOOL)gt_superRespondsToSelector:(SEL)selector;

/**
 Check whether a superclass implements or inherits a specified method.

 @param selector A selector that identifies a method.
 @param stopClass A final super class to stop quering (excluding it).
 @return YES if one of super classes in hierarchy responds a specified selector.
 */
- (BOOL)gt_superRespondsToSelector:(SEL)selector untilClass:(Class)stopClass;

/**
 Check whether the receiver's instances implement or inherit a specified method up to and exluding a particular class in hierarchy.

 @param selector A selector that identifies a method.
 @param stopClass A final super class to stop quering (excluding it).
 @return YES if one of super classes in hierarchy responds a specified selector.
 */
+ (BOOL)gt_instancesRespondToSelector:(SEL)selector untilClass:(Class)stopClass;

@end
