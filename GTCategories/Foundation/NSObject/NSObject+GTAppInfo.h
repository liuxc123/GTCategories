//
//  NSObject+GTAppInfo.h
//  GTCategories
//
//  Created by liuxc on 2018/11/16.
//

#import <Foundation/Foundation.h>

@interface NSObject (GTAppInfo)

-(NSString *)gt_version;
-(NSInteger)gt_build;
-(NSString *)gt_identifier;
-(NSString *)gt_currentLanguage;
-(NSString *)gt_deviceModel;

@end
