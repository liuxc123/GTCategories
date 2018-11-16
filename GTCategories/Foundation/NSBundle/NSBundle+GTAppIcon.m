//
//  NSBundle+GTAppIcon.m
//  FBSnapshotTestCase
//
//  Created by liuxc on 2018/11/16.
//

#import "NSBundle+GTAppIcon.h"

@implementation NSBundle (GTAppIcon)

- (NSString*)gt_appIconPath {
    NSString* iconFilename = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleIconFile"] ;
    NSString* iconBasename = [iconFilename stringByDeletingPathExtension] ;
    NSString* iconExtension = [iconFilename pathExtension] ;
    return [[NSBundle mainBundle] pathForResource:iconBasename
                                           ofType:iconExtension] ;
}

- (UIImage*)gt_appIcon {
    UIImage*appIcon = [[UIImage alloc] initWithContentsOfFile:[self gt_appIconPath]] ;
    return appIcon;
}

@end
