//
//  NotificationDemo.m
//  DemoNotificationProject
//
//  Created by Bushra-Sagir on 12/08/1939 Saka.
//  Copyright © 1939 Saka Facebook. All rights reserved.
//

#import "NotificationDemo.h"
#import <UserNotifications/UserNotifications.h>
#import <React/RCTRootView.h>

@implementation NotificationDemo
RCT_EXPORT_MODULE();

- (void)callNotification {
  NSLog(@"Test Notification");

}

RCT_EXPORT_METHOD(sendNotification) {
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
  UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
  
  UNNotificationAction *snoozeAction = [UNNotificationAction actionWithIdentifier:@"Snooze"
                                                                            title:@"Snooze" options:UNNotificationActionOptionNone];
  UNNotificationAction *deleteAction = [UNNotificationAction actionWithIdentifier:@"Delete"
                                                                            title:@"Delete" options:UNNotificationActionOptionDestructive];
  
  UNNotificationCategory *category = [UNNotificationCategory categoryWithIdentifier:@"UYLReminderCategory"
                                                                            actions:@[snoozeAction,deleteAction] intentIdentifiers:@[]
                                                                            options:UNNotificationCategoryOptionNone];
  NSSet *categories = [NSSet setWithObject:category];
  
  [center setNotificationCategories:categories];
  
  
  UNMutableNotificationContent *content = [UNMutableNotificationContent new];
  content.title = @"Don't forget";
  content.body = @"Buy some milk";
  content.categoryIdentifier = @"UYLReminderCategory";
  content.sound = [UNNotificationSound defaultSound];
  
  UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:3 repeats:NO];
  
  NSString *identifier = @"UYLLocalNotification";
  UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:identifier content:content trigger:trigger];
  
  [center addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
    if (error != nil) {
      NSLog(@"Something went wrong: %@",error);
    }
  }];
}
@end
