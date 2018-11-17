//
//  NSArray+GTBlock.m
//  GTCategories
//
//  Created by liuxc on 2018/11/16.
//

#import "NSArray+GTBlock.h"

@implementation NSArray (GTBlock)

- (void)gt_each:(void (^)(id object))block {
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        block(obj);
    }];
}

- (void)gt_eachWithIndex:(void (^)(id object, NSUInteger index))block {
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        block(obj, idx);
    }];
}

- (NSArray *)gt_map:(id (^)(id object))block {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:self.count];

    for (id object in self) {
        [array addObject:block(object) ?: [NSNull null]];
    }

    return array;
}

- (NSArray *)gt_filter:(BOOL (^)(id object))block {
    return [self filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) {
        return block(evaluatedObject);
    }]];
}

- (NSArray *)gt_reject:(BOOL (^)(id object))block {
    return [self filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) {
        return !block(evaluatedObject);
    }]];
}

- (id)gt_detect:(BOOL (^)(id object))block {
    for (id object in self) {
        if (block(object))
            return object;
    }
    return nil;
}

- (id)gt_reduce:(id (^)(id accumulator, id object))block {
    return [self gt_reduce:nil withBlock:block];
}

- (id)gt_reduce:(id)initial withBlock:(id (^)(id accumulator, id object))block {
    id accumulator = initial;

    for(id object in self)
        accumulator = accumulator ? block(accumulator, object) : object;

    return accumulator;
}

@end
