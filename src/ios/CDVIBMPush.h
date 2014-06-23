//-------------------------------------------------------------------------------
// Licensed Materials - Property of IBM
// XXXX-XXX (C) Copyright IBM Corp. 2013,2014. All Rights Reserved.
// US Government Users Restricted Rights - Use, duplication or
// disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
//-------------------------------------------------------------------------------

#import <Foundation/Foundation.h>
#import <Cordova/CDV.h>
#import <IBMPush/IBMPush.h>
#import <IBMBluemix/IBMBluemix.h>

@interface CDVIBMPush : CDVPlugin

- (void) notificationReceived:(NSDictionary*)notification;

@end
