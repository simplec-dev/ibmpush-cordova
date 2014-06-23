Push service SDK for IBM Bluemix
===

BlueMix supports IBM's MobileFirst strategy by allowing you as a mobile developer to quickly incorporate pre-built, managed, and scalable cloud services into your mobile applications without relying on IT involvement. You can focus on building your mobile applications rather than the complexities of managing the back end infrastructure.

When you create a Mobile Cloud Starter application, BlueMix provisions multiple services under a single application context. Your mobile application is given access to the following mobile services: Mobile Application Security, Push, and Mobile Data.

About
---

The Hybrid JavaScript SDK uses the underlying Cordova runtime to hosting your hybrid application. This SDK then forms a bridge between the Web View and the Mobile Starter Native SDK. With this library you can:

- Reuse the code that is implemented within the Native toolkits, offering a single point of interaction between the Hybrid application and the BlueMix services.
- Use a single native domain for communication. Take advantage of a single point of security when communicating with BlueMix.
- Maintain security state of your application if the WebView is restarted on iOS (Apple 10 second rule).
- Reduce memory overhead of the WebView because less JavaScript is required for the the communication.
- Communicate through the same technology channel with both both Native and Hybrid (Cross Platform) content.
- Improve performance when you are using the Native tier of the application for processing of requests.

IBMPush - Cordova
===

The Mobile Cloud Services SDK is a Cordova SDK you can use inside a Cordova or IBM Worklight application. The `IBMPush` SDK manages all the invocation of calls to the IBM Bluemix Push Service.

Cordova
---
You can find out more information about Cordova and its related services and plugins at the following links.

###Cordova Documentation:

http://cordova.apache.org/docs/en/3.0.0/guide_overview_index.md.html#Overview

###Cordova plugin development guide
http://cordova.apache.org/docs/en/2.2.0/guide_plugin-development_index.md.html#Plugin%20Development%20Guide

## Getting Started Guide

Before you download the plugin or add it to your project you may want to have a read through the more detailed `Getting Started Guide`. For quick usage information, see the [Getting Started Guide](https://mbaas-gettingstarted.ng.bluemix.net/hybrid)

## Setup

To create add a plugin to your project, you first need to have installed the Cordova tools and created a project. You can find more information on how to achieve this from the Cordova project [Command Line Interface](http://cordova.apache.org/docs/en/3.5.0/guide_cli_index.md.html#The%20Command-Line%20Interface)

Adding the plugin to your project

```bash
cordova plugin add com.ibm.mobile.cordova.ibmpush
```

Removing the plugin from your project

To install the plugin use the following cordova command

```bash
cordova plugin remove com.ibm.mobile.cordova.ibmpush
```

## Manual Installation

IBM Worklight is a Cordova based Hybrid application platform. You can find more information about IBM Worklight at this link [IBM Worklight Foundation](http://www-03.ibm.com/software/products/en/worklight-foundation)

Detailed instructions of how to install the plugin inside an IBM Worklight development environment can be found in the [Getting Started Guide](https://mbaas-gettingstarted.ng.bluemix.net/hybrid)

## IBMPush.hybrid API 

For more information, see the [API Reference](https://mobile.ng.bluemix.net/mbaas-api/docs/JavaScript/index.html)

## Supported Platforms

- Android
- iOS

Services
--

Each of the services for the Cordova SDK is in a separate plugin that you can add to your project individually.

This allows maximum flexibility to the developer to individually pick and choose the services that are key to the application. The JavaScript SDK contains the following services.

- [ibmbluemix](https://hub.jazz.net/project/bluemixmobilesdk/ibmbluemix-cordova/overview)
- [ibmcloudcode](https://hub.jazz.net/project/bluemixmobilesdk/ibmcloudcode-cordova/overview)
- [ibmdata](https://hub.jazz.net/project/bluemixmobilesdk/ibmdata-cordova/overview)
- [ibmpush](https://hub.jazz.net/project/bluemixmobilesdk/ibmpush-cordova/overview)

Each one of these services can be added to your project.
