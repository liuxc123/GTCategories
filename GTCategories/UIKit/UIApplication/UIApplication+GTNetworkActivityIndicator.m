//
//  UIApplication+GTNetworkActivityIndicator.m
//  GTCategories
//
//  Created by liuxc on 2018/11/16.
//

#import "UIApplication+GTNetworkActivityIndicator.h"

#import <libkern/OSAtomic.h>

@implementation UIApplication (GTNetworkActivityIndicator)

static volatile int32_t numberOfActiveNetworkConnectionsxxx;

#pragma mark Public API

- (void)gt_beganNetworkActivity
{
    self.networkActivityIndicatorVisible = OSAtomicAdd32(1, &numberOfActiveNetworkConnectionsxxx) > 0;
}

- (void)gt_endedNetworkActivity
{
    self.networkActivityIndicatorVisible = OSAtomicAdd32(-1, &numberOfActiveNetworkConnectionsxxx) > 0;
}

@end
