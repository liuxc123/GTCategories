//
//  NSException+GTTrace.h
//  GTCategories
//
//  Created by liuxc on 2018/11/16.
//

#import <Foundation/Foundation.h>

@interface NSException (GTTrace)

- (NSArray *)gt_backtrace;

@end
