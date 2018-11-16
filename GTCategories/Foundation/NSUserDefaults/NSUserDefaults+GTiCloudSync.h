//
//  NSUserDefaults+GTiCloudSync.h
//  FBSnapshotTestCase
//
//  Created by liuxc on 2018/11/16.
//

//https://github.com/RiccardoPaolillo/NSUserDefault-iCloud
// A very simple iOS Category for synchronize NSUserDefaults with iCloud (NSUbiquitousKeyValueStore)

#import <Foundation/Foundation.h>

@interface NSUserDefaults (GTiCloudSync)

-(void)gt_setValue:(id)value  forKey:(NSString *)key iCloudSync:(BOOL)sync;
-(void)gt_setObject:(id)value forKey:(NSString *)key iCloudSync:(BOOL)sync;

-(id)gt_valueForKey:(NSString *)key  iCloudSync:(BOOL)sync;
-(id)gt_objectForKey:(NSString *)key iCloudSync:(BOOL)sync;

-(BOOL)gt_synchronizeAlsoiCloudSync:(BOOL)sync;

@end
