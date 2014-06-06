# com.ibm.baas.cordova.ibmpush

Provides access to the IBMPush 

## Automatic Installation

    cordova plugin add com.ibm.baas.cordova.ibmpush

## IBMPush API

IBMBaaS provides access to the following methods. 

- IBMPush.initializeService
- IBMPush.registerDevice
- IBMPush.getTags
- IBMPush.getSubscriptions
- IBMPush.subscribeTag
- IBMPush.unsubscribeTag


## IBMPush.initializeService

The `IBMPush.initializeService` method will initialize the IBMPush SDK.


### Example

    function onSuccess() {
        alert('Successfully initialized IBMPush SDK.');
    };

    function onError(initializationError) {
         alert('Error occurred when initializing IBMPush SDK.');
    };

    IBMPush.initializeService(onSuccess, onError);

## Supported Platforms

- Android
- iOS


## Set up instructions for the Cordova application to use IBMPush SDK

To use IBMPush Cordova plugin for iOS, the following setup needs to be done on the Cordova application's AppDelegate.

1) Add the following to AppDelegate.h file

```objective-c

@property (nonatomic, strong) NSData* token;

```       

2) Add the following to AppDelegate.m file

```objective-c

// Import the header file.
#import "CDVIBMPush.h"

// Add this to didFinishLaunchingWithOptions method
- (BOOL)application:(UIApplication*)application didFinishLaunchingWithOptions:(NSDictionary*)launchOptions
{
	 // Register to receive remote notification
    [application registerForRemoteNotificationTypes:
    UIRemoteNotificationTypeBadge |
    UIRemoteNotificationTypeAlert |
    UIRemoteNotificationTypeSound];
}

// Add this to didRegisterForRemoteNotificationsWithDeviceToken() method
- (void)application:(UIApplication*)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData*)deviceToken
{
    // Set the device token to be passed onto Cordova plugin.
    self.token = deviceToken;
}

// Add this to didFailToRegisterForRemoteNotificationsWithError() method
- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)err
{
	//Failed to receive device token from APNS
}

// Add this to didReceiveRemoteNotification() method
- (void)application:(UIApplication*)application didReceiveRemoteNotification:(NSDictionary*)userInfo
{
    //Pass the notification to cordova to be sent back to the hybrid application.
    CDVIBMPush *pushhandler = [self.viewController getCommandInstance:@"IBMPush"];
    [pushhandler notificationReceived:userInfo];
}

```


