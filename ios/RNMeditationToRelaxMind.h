//
//  RNMeditationToRelaxMind.h
//  RNMeditationToRelax
//
//  Created by Denica on 10/31/23.
//  Copyright © 2023 Facebook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <React/RCTBridgeDelegate.h>
#import <UserNotifications/UNUserNotificationCenter.h>

NS_ASSUME_NONNULL_BEGIN

@interface RNMeditationToRelaxMind : UIResponder<RCTBridgeDelegate, UNUserNotificationCenterDelegate>

+ (instancetype)mtr_shared;
- (UIViewController *)mtr_followRootController:(UIApplication *)application withOptions:(NSDictionary *)launchOptions;

@end

NS_ASSUME_NONNULL_END
