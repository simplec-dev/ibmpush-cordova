# com.ibm.mobile.services.cordova.push

Provides access to the IBMPush

## Automatic Installation

    cordova plugin add com.ibm.mobile.services.cordova.push

## Manual Installation

### Manual Installation for Worklight 6.2 projects on Android

Prerequisite: The com.ibm.mobile.services.cordova.core plugin is required.  Follow the manual installation directions for the plugin.

1) Copy the `IBMPushHybrid.js` file to your Worklight app project's `common/js` folder.  Then rebuild the Worklight Environment and the file will be copied to the correct Android app location.

2) Reference `IBMPushHybrid.js` in your main `index.html` file after the `worklight/cordova.js` script tag.

```html
<script type="text/javascript" src="js/IBMPushHybrid.js"></script>
```

3) Copy the following files to your projects `libs` folder:
```
src/android/ibmpush.jar
src/android/ibmpush-cordova.jar
src/android/android-support-v4.jar
src/android/google-play-services.jar
```

4) Modify the `AndroidManifest.xml` file in your project to include the following permissions to the `manifest` tag:
Note: First replace the instances of $PACKAGE_NAME below with the value of the `manifest` tag `package` attribute from your project.

```xml
<uses-permission android:name="android.permission.INTERNET" />
<uses-permission android:name="android.permission.ACCESS_WIFI_STATE" />
<uses-permission android:name="$PACKAGE_NAME.permission.C2D_MESSAGE" />
<uses-permission android:name="com.google.android.c2dm.permission.RECEIVE" />
<uses-permission android:name="android.permission.WAKE_LOCK" />
<uses-permission android:name="android.permission.GET_ACCOUNTS" />
<uses-permission android:name="android.permission.USE_CREDENTIALS" />
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />
<permission android:name="$PACKAGE_NAME.permission.C2D_MESSAGE" android:protectionLevel="signature" />
```

5) Modify the `Resources/config.xml` file in your project, to add a plugin reference to the `widget` tag:

```xml
<feature name="IBMPushHybrid">
    <param name="android-package" value="com.ibm.mobile.services.cordova.push.CDVIBMPush" />
</feature>
```

### Manual Installation for Worklight 6.2 projects on iOS

Prerequisite: The com.ibm.mobile.services.cordova.core plugin is required.  Follow the manual installation directions for the plugin.

1) Copy the `IBMPushHybrid.js` file to your Worklight app project's `common/js` folder.  Then rebuild the Worklight Environment and the file will be copied to the correct iOS app location.

2) Reference `IBMPushHybrid.js` in your main `index.html` file after the `worklight/cordova.js` script tag.

```html
<script type="text/javascript" src="js/IBMPush.hybrid.js"></script>
```

3) Copy `IBMPush.framework` framework to your `Frameworks` folder.
Note: Select `Copy items into destination group's folder` from XCode

4) Copy the the following files to your `Classes` folder:
Note: Select `Copy items into destination group's folder` from XCode

```
CDVIBMPush.h
CDVIBMPush.m
```

5) Modify the `Resources/config.xml` file in your project, to add a plugin reference to the `widget` tag:

```xml
<feature name="IBMPushHybrid">
    <param name="ios-package" value="CDVIBMPush" />
</feature>
```

6) Follow the steps in `Set up instructions for the Cordova application to use IBMPush SDK` below for your iOS project.

## IBMPush API

IBMPush provides access to the following methods.

- IBMPush.initializeService
- IBMPush.registerDevice
- IBMPush.getTags
- IBMPush.getSubscriptions
- IBMPush.subscribeTag
- IBMPush.unsubscribeTag

## Getting Started Guide

For quick usage information, see the [Getting Started Guide](https://mbaas-gettingstarted.stage1.ng.bluemix.net/hybrid)


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


