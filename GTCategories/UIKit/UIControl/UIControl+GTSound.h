//
//  UIControl+GTSound.h
//  FBSnapshotTestCase
//
//  Created by liuxc on 2018/11/16.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface UIControl (GTSound)

/// Set the sound for a particular control event (or events).
/// @param name The name of the file. The method looks for an image with the specified name in the application’s main bundle.
/// @param controlEvent A bitmask specifying the control events for which the action message is sent. See “Control Events” for bitmask constants.
//不同事件增加不同声音
- (void)gt_setSoundNamed:(NSString *)name forControlEvent:(UIControlEvents)controlEvent;

@end
