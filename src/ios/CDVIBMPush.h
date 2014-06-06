//
//  CDVIBMPush.h
//  IBMPushWorks_Cordova_IOS
//
//  Created by Jim Dickens on 4/10/14.
//
//

#import <Foundation/Foundation.h>
#import <Cordova/CDV.h>
#import <IBMPush/IBMPush.h>
#import <IBMBaaS/IBMBaaS.h>

@interface CDVIBMPush : CDVPlugin

- (void) notificationReceived:(NSDictionary*)notification;

@end
