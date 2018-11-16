//
//  UIApplication+GTNetworkActivityIndicator.h
//  FBSnapshotTestCase
//
//  Created by liuxc on 2018/11/16.
//

#import <UIKit/UIKit.h>

@interface UIApplication (GTNetworkActivityIndicator)

/*
 This category will automatically keep track of concurrent network activity and display the network activity indicator accordingly.
 */

/// Tell the application that network activity has begun. The network activity indicator will then be shown.
/// Display the network activity indicator to provide feedback when your application accesses the network for more than a couple of seconds. If the operation finishes sooner than that, you don’t have to show the network activity indicator, because the indicator would be likely to disappear before users notice its presence.
- (void)gt_beganNetworkActivity;

/// Tell the application that a session of network activity has begun. The network activity indicator will remain showing or hide automatically depending the presence of other ongoing network activity in the app.
- (void)gt_endedNetworkActivity;


@end
