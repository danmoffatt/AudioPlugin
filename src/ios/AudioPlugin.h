#import <Cordova/CDVPlugin.h>

@interface AudioPlugin : CDVPlugin {}

- (void)play:(CDVInvokedUrlCommand *)command;
- (void)stop:(CDVInvokedUrlCommand *)command;

@end
