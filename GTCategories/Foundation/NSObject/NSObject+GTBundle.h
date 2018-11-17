//
//  NSObject+GTBundle.h
//  GTCategories
//
//  Created by liuxc on 2018/11/16.
//

#import <Foundation/Foundation.h>

@interface NSObject (GTBundle)

- (NSBundle *)gt_bundleWithName:(NSString *)bundleName shouldReturnMainBundleIfBundleNotFound:(BOOL)shouldReturnMainBundleIfBundleNotFound;

@end
