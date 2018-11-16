//
//  NSObject+GTBundle.m
//  FBSnapshotTestCase
//
//  Created by liuxc on 2018/11/16.
//

#import "NSObject+GTBundle.h"

@interface GTBundleCache : NSObject

@property (nonatomic, strong) NSCache *cache;
+ (instancetype)sharedInstance;

@end

@implementation GTBundleCache

+ (instancetype)sharedInstance
{
    static GTBundleCache *bundleCache = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        bundleCache = [[GTBundleCache alloc] init];
    });
    return bundleCache;
}

#pragma mark - getters and setters
- (NSCache *)cache
{
    if (_cache == nil) {
        _cache = [[NSCache alloc] init];
        _cache.countLimit = 10;
    }
    return _cache;
}

@end

@implementation NSObject (GTBundle)

- (NSBundle *)gt_bundleWithName:(NSString *)bundleName shouldReturnMainBundleIfBundleNotFound:(BOOL)shouldReturnMainBundleIfBundleNotFound
{
    NSBundle *bundle = [[GTBundleCache sharedInstance].cache objectForKey:bundleName];
    if ([bundle isKindOfClass:[NSNumber class]]) {
        // NSNotFound
        return nil;
    }
    if (bundle != nil && [bundle isKindOfClass:[NSBundle class]]) {
        return bundle;
    }

    NSString *bundlePath = [[NSBundle mainBundle] pathForResource:bundleName ofType:@"bundle"];
    if (!bundlePath) {
        bundlePath = [[NSBundle mainBundle] pathForResource:bundleName ofType:@"bundle" inDirectory:@"Frameworks"];
    }
    if (!bundlePath) {
        bundlePath = [[NSBundle mainBundle] pathForResource:bundleName ofType:@"bundle" inDirectory:[NSString stringWithFormat:@"Frameworks/%@.framework", bundleName]];
    }

    bundle = [NSBundle bundleWithPath:bundlePath];

    if (shouldReturnMainBundleIfBundleNotFound == YES && bundle == nil) {
        bundle = [NSBundle mainBundle];
    }

    if (bundle != nil) {
        [[GTBundleCache sharedInstance].cache setObject:bundle forKey:bundleName];
    } else {
        [[GTBundleCache sharedInstance].cache setObject:@(NSNotFound) forKey:bundleName];
    }

    return bundle;
}


@end
