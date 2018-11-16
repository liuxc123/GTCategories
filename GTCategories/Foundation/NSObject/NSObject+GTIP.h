//
//  NSObject+GTIP.h
//  FBSnapshotTestCase
//
//  Created by liuxc on 2018/11/16.
//

#import <Foundation/Foundation.h>

@interface NSObject (GTIP)

- (NSString *)gt_ipAddressWithShouldPreferIPv4:(BOOL)preferIPv4;

@end
