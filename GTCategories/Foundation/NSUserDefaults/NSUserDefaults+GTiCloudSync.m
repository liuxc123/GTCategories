//
//  NSUserDefaults+GTiCloudSync.m
//  GTCategories
//
//  Created by liuxc on 2018/11/16.
//

#import "NSUserDefaults+GTiCloudSync.h"

@implementation NSUserDefaults (GTiCloudSync)

-(void)gt_setValue:(id)value forKey:(NSString *)key iCloudSync:(BOOL)sync
{
    if (sync)
        [[NSUbiquitousKeyValueStore defaultStore] setValue:value forKey:key];

    [self setValue:value forKey:key];
}

-(id)gt_valueForKey:(NSString *)key iCloudSync:(BOOL)sync
{
    if (sync)
    {
        //Get value from iCloud
        id value = [[NSUbiquitousKeyValueStore defaultStore] valueForKey:key];

        //Store locally and synchronize
        [self setValue:value forKey:key];
        [self synchronize];

        return value;
    }

    return [self valueForKey:key];
}

- (void)gt_removeValueForKey:(NSString *)key iCloudSync:(BOOL)sync
{
    [self gt_removeObjectForKey:key iCloudSync:sync];
}



-(void)gt_setObject:(id)value forKey:(NSString *)defaultName iCloudSync:(BOOL)sync
{
    if (sync)
        [[NSUbiquitousKeyValueStore defaultStore] setObject:value forKey:defaultName];

    [self setObject:value forKey:defaultName];
}

-(id)gt_objectForKey:(NSString *)key iCloudSync:(BOOL)sync
{
    if (sync)
    {
        //Get value from iCloud
        id value = [[NSUbiquitousKeyValueStore defaultStore] objectForKey:key];

        //Store to NSUserDefault and synchronize
        [self setObject:value forKey:key];
        [self synchronize];

        return value;
    }

    return [self objectForKey:key];
}

- (void)gt_removeObjectForKey:(NSString *)key iCloudSync:(BOOL)sync
{
    if (sync)
        [[NSUbiquitousKeyValueStore defaultStore] removeObjectForKey:key];

    //Remove from NSUserDefault
    return [self removeObjectForKey:key];
}



- (BOOL)gt_synchronizeAlsoiCloudSync:(BOOL)sync
{
    BOOL res = true;

    if (sync)
        res &= [self synchronize];

    res &= [[NSUbiquitousKeyValueStore defaultStore] synchronize];

    return res;
}

@end
