//
//  NSObject+GTAlert.h
//  FBSnapshotTestCase
//
//  Created by liuxc on 2018/11/16.
//

#import <UIKit/UIKit.h>

@interface NSObject (GTAlert)

- (void)gt_showAlertWithTitle:(NSString *)title
                      message:(NSString *)message
              actionTitleList:(NSArray <NSString *> *)actionTitleList
                      handler:(void(^)(UIAlertAction * action, NSUInteger index))handler
                   completion:(void (^)(void))completion;

- (void)gt_showAlertInputWithTitle:(NSString *)title
                           message:(NSString *)message
                   placeholderList:(NSArray <NSString *> *)placeholderList
                   actionTitleList:(NSArray <NSString *> *)actionTitleList
                           handler:(void(^)(UIAlertAction * action, UIAlertController * alertController, NSUInteger index))handler
                        completion:(void (^)(void))completion;
@end
