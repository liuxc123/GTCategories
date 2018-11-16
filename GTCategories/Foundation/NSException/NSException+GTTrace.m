//
//  NSException+GTTrace.m
//  FBSnapshotTestCase
//
//  Created by liuxc on 2018/11/16.
//

#import "NSException+GTTrace.h"
#include <execinfo.h>

@implementation NSException (GTTrace)

- (NSArray *)gt_backtrace
{
    NSArray *addresses = self.callStackReturnAddresses;
    unsigned count = (int)addresses.count;
    void **stack = malloc(count * sizeof(void *));

    for (unsigned i = 0; i < count; ++i)
        stack[i] = (void *)[addresses[i] longValue];

    char **strings = backtrace_symbols(stack, count);
    NSMutableArray *ret = [NSMutableArray arrayWithCapacity:count];

    for (int i = 0; i < count; ++i)
        [ret addObject:@(strings[i])];

    free(stack);
    free(strings);

    return ret;
}

@end
