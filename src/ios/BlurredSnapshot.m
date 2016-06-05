/********* cordova-plugin-blurred-snapshot.m Cordova Plugin Implementation *******/

#import <Cordova/CDV.h>
#import "UIView+blur.h"

@interface BlurredSnapshot : CDVPlugin {
  // Member variables go here.
}

- (void)addBlurredSnapshot:(CDVInvokedUrlCommand*)command;
- (void)removeBlurredSnapshot:(CDVInvokedUrlCommand*)command;
@end

@implementation BlurredSnapshot

- (void)addBlurredSnapshot:(CDVInvokedUrlCommand*)command {

    CDVPluginResult* pluginResult = nil;

    if ([self appDelegate] != nil && [[self appDelegate] isKindOfClass:[CDVAppDelegate class]]) {
        [((CDVAppDelegate *)[self appDelegate]).window addBlurredSnapshot];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)removeBlurredSnapshot:(CDVInvokedUrlCommand*)command {

    CDVPluginResult* pluginResult = nil;

    if ([self appDelegate] != nil && [[self appDelegate] isKindOfClass:[CDVAppDelegate class]]) {
        [((CDVAppDelegate *)[self appDelegate]).window removeBlurredSnapshot];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
