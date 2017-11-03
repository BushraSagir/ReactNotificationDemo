//
//  NotificationDemo.h
//  DemoNotificationProject
//
//  Created by Bushra-Sagir on 12/08/1939 Saka.
//  Copyright © 1939 Saka Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <React/RCTConvert.h>
#import <React/RCTBridgeModule.h>
#import <React/RCTRootView.h>

@interface NotificationDemo : NSObject<RCTBridgeModule>
- (void)sendNotification;
@end
