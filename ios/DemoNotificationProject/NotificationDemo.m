//
//  NotificationDemo.m
//  DemoNotificationProject
//
//  Created by Bushra-Sagir on 12/08/1939 Saka.
//  Copyright © 1939 Saka Facebook. All rights reserved.
//

#import "NotificationDemo.h"
#import <UserNotifications/UserNotifications.h>

@implementation NotificationDemo
RCT_EXPORT_MODULE();

- (void)callNotification {
  NSLog(@"Test Notification");

}

RCT_EXPORT_METHOD(sendNotificationresolver: (RCTPromiseResolveBlock)resolve
								 rejecter: (RCTPromiseRejectBlock)reject) {
  NSLog(@"Notifications Called");
  UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(scheduleLocalNotifications) name:@"SnoozeNotifcation" object:nil];
  [center getNotificationSettingsWithCompletionHandler:^(UNNotificationSettings * _Nonnull settings) {
    if (settings.authorizationStatus == UNAuthorizationStatusAuthorized) {
      // Notifications allowed
  [self scheduleLocalNotifications];
    } else {
      // Notifications not allowed
    }
  }];
}




#pragma mark - Custom Methods


- (void)scheduleLocalNotifications {
  UNMutableNotificationContent *objNotificationContent = [[UNMutableNotificationContent alloc] init];
	objNotificationContent.title = [NSString localizedUserNotificationStringForKey:@"Notification!" arguments:nil];
	objNotificationContent.body = [NSString localizedUserNotificationStringForKey:@"This is local demo local notification message!"
																																			arguments:nil];
	objNotificationContent.sound = [UNNotificationSound defaultSound];
	
	UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:@"ten"
																																				content:objNotificationContent trigger:nil];
	UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
	[center addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
		if (!error) {
			NSLog(@"Local Notification succeeded");
		}
		else {
			NSLog(@"Local Notification failed");
		}
	}];
  
}
@end
