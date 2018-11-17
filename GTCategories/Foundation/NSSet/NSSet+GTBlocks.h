//
//  NSSet+GTBlocks.h
//  GTCategories
//
//  Created by liuxc on 2018/11/16.
//

#import <Foundation/Foundation.h>

@interface NSSet (GTBlocks)

- (void)gt_each:(void (^)(id))block;
- (void)gt_eachWithIndex:(void (^)(id, int))block;
- (NSArray *)gt_map:(id (^)(id object))block;
- (NSArray *)gt_select:(BOOL (^)(id object))block;
- (NSArray *)gt_reject:(BOOL (^)(id object))block;
- (NSArray *)gt_sort;
- (id)gt_reduce:(id(^)(id accumulator, id object))block;
- (id)gt_reduce:(id)initial withBlock:(id(^)(id accumulator, id object))block;

@end
