//
//  NSArray+GTBlock.h
//  FBSnapshotTestCase
//
//  Created by liuxc on 2018/11/16.
//

#import <Foundation/Foundation.h>

@interface NSArray (GTBlock)

- (void)gt_each:(void (^)(id object))block;
- (void)gt_eachWithIndex:(void (^)(id object, NSUInteger index))block;
- (NSArray *)gt_map:(id (^)(id object))block;
- (NSArray *)gt_filter:(BOOL (^)(id object))block;
- (NSArray *)gt_reject:(BOOL (^)(id object))block;
- (id)gt_detect:(BOOL (^)(id object))block;
- (id)gt_reduce:(id (^)(id accumulator, id object))block;
- (id)gt_reduce:(id)initial withBlock:(id (^)(id accumulator, id object))block;

@end
