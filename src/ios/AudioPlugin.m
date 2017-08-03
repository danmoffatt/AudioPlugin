#import "AudioPlugin.h"

#import <Cordova/CDVAvailability.h>

@implementation AudioPlugin

- (void)pluginInitialize {
}

- (void)play:(CDVInvokedUrlCommand *)command {
  NSString* file = [command.arguments objectAtIndex:0];
  NSLog(@"play file: %@", file);
}

- (void)stop:(CDVInvokedUrlCommand *)command {
    NSLog(@"stop file");

  CDVPluginResult *result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:iso8601String];
  [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}

@end
