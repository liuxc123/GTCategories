//
//  NSDictionary+GTBlock.h
//  FBSnapshotTestCase
//
//  Created by liuxc on 2018/11/16.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (GTBlock)

#pragma mark - RX
- (void)gt_each:(void (^)(id k, id v))block;
- (void)gt_eachKey:(void (^)(id k))block;
- (void)gt_eachValue:(void (^)(id v))block;
- (NSArray *)gt_map:(id (^)(id key, id value))block;
- (NSDictionary *)gt_pick:(NSArray *)keys;
- (NSDictionary *)gt_omit:(NSArray *)key;

@end
