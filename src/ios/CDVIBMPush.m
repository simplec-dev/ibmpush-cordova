//
//  CDVIBMPush.m
//  IBMPushWorks_Cordova_IOS
//
//  Created by Jim Dickens on 4/10/14.
//
//

#import "CDVIBMPush.h"
#import "AppDelegate.h"
#import <IBMPush/IBMPush.h>
#import <IBMBaaS/IBMBaaS.h>

@interface CDVIBMPush ()

@property (nonatomic) IBMPush* push;
@property (nonatomic) NSDictionary* notification;

@end

@implementation CDVIBMPush;
static NSString* callbackString;

- (void)initializeService:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* result = nil;
    [IBMPush initializeService];
    result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK ];
    _push = [IBMPush service];
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}

- (void)registerDevice:(CDVInvokedUrlCommand*)command
{
    __block CDVPluginResult* result = nil;
    callbackString = [command.arguments objectAtIndex:2];
    
    NSString* consumerId = [command.arguments objectAtIndex:0];
    NSString* alias = [command.arguments objectAtIndex:1];
    
    NSString* token = [[[[((AppDelegate *)[[UIApplication sharedApplication] delegate]).token description]
                         stringByReplacingOccurrencesOfString: @"<" withString: @""]
                        stringByReplacingOccurrencesOfString: @">" withString: @""]
                       stringByReplacingOccurrencesOfString: @" " withString: @""];
    
    NSLog(@"alias is %@ and consumerId is %@", alias, consumerId);
    NSLog(@"Device token is: %@", token);
    
    if (_push == nil) {
        result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Push Service not initialized."];
        [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
    }
    else if (token.length == 0) {
        result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Device token was null."];
        [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
    }
    else {
        [[_push registerDevice:alias withConsumerId:consumerId withDeviceToken:token] continueWithBlock:^id(BFTask *task) {
            if(task.error){
                result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:task.error.description];
                [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
            } else {
                result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:task.result];
                [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
                
            }
            return nil;
        }];
    }
}


- (void)getTags:(CDVInvokedUrlCommand*)command
{
    __block CDVPluginResult* result = nil;
    
    if (_push == nil) {
        result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Push Service not initialized."];
        [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
    }
    else {
        [[_push getTags] continueWithBlock:^id(BFTask* task){
            if (task.error){
                result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:task.error.description];
                [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
            } else {
                result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:task.result];
                [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
            }
            return nil;
        }];
        
    }
}

- (void)getSubscriptions:(CDVInvokedUrlCommand*)command
{
    __block CDVPluginResult* result = nil;
    
    if (_push == nil) {
        result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Push Service not initialized."];
        [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
    }
    [[_push getSubscriptions] continueWithBlock:^id(BFTask* task){
        if (task.error){
            result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:task.error.description];
            [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
        } else {
            result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:task.result];
            [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
        }
        return nil;
    }];
}


- (void)subscribeTag:(CDVInvokedUrlCommand*)command
{
    __block CDVPluginResult* result = nil;
    NSString* tag = [command.arguments objectAtIndex:0];
    
    if(_push == nil){
        result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Push Service not initialized."];
        [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
    }
    else if(tag.length == 0){
        result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Tag name cannot be null.  Please enter a valid tag name."];
        [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
    }
    else {
        [[_push subscribeToTag:tag] continueWithBlock:^id(BFTask* task){
            if (task.error){
                result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:task.error.description];
                [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
            } else {
                result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:task.result];
                [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
            }
            return nil;
        }];
    }
}

- (void) unsubscribeTag:(CDVInvokedUrlCommand*)command
{
    __block CDVPluginResult* result = nil;
    NSString* tag = [command.arguments objectAtIndex:0];
    
    if(_push == nil){
        result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Push Service not initialized."];
        [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
    }
    else if(tag.length == 0){
        result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Tag name cannot be null.  Please enter a valid tag name."];
        [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
    }
    else {
        [[_push unsubscribeFromTag:tag] continueWithBlock:^id(BFTask* task){
            if (task.error){
                result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:task.error.description];
                [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
            } else {
                result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:task.result];
                [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
            }
            return nil;
        }];
    }
}

NSMutableString *escape(NSString *source) {
    static NSMutableCharacterSet *offending;
    if (!offending) {
        offending = [NSMutableCharacterSet characterSetWithRange:NSMakeRange(0, 32)];
        [offending addCharactersInString: @"'\"\\"];
    }
    
    NSMutableString *escaped = [[NSMutableString alloc] init];
    
    if ([source rangeOfCharacterFromSet:offending].length) {
        for (NSUInteger i = 0, n = source.length; i < n; ++i) {
            unichar c = [source characterAtIndex:i];
            switch (c) {
				case '\'': [escaped appendString:@"\\\'"]; break;
				case '\"': [escaped appendString:@"\\\""]; break;
				case '\\': [escaped appendString:@"\\\\"]; break;
				case '\n': [escaped appendString:@"\\n"];  break;
				case '\r': [escaped appendString:@"\\r"];  break;
				case '\v': [escaped appendString:@"\\v"];  break;
				case '\t': [escaped appendString:@"\\t"];  break;
				case '\f': [escaped appendString:@"\\f"];  break;
				default:   [escaped appendFormat:c >= 0x20 ? @"%c" : @"\\%x02", c]; break;
            }
        }
	}
	else [escaped appendString:source];
	return escaped;
}

- (void) notificationReceived: (NSDictionary*) notification
{
    NSString *sendToJS = [NSString stringWithFormat:@"%@(\"%@\");", callbackString, escape(notification.description)];
    [self.webView stringByEvaluatingJavaScriptFromString:sendToJS];
}

@end
