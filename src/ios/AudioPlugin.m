#import "AudioPlugin.h"
#import <Cordova/CDVAvailability.h>
@import AVFoundation;

@interface AudioPlugin() {
    AVPlayer *audioPlayer;
}

@end

@implementation AudioPlugin

- (void)pluginInitialize {}

- (void)play:(CDVInvokedUrlCommand *)command {
    NSString* file = [command.arguments objectAtIndex:0];
    
    [self _stop];
    
    audioPlayer = [[AVPlayer alloc]initWithURL:[NSURL URLWithString:file]];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(playerItemDidReachEnd:)
                                                 name:AVPlayerItemDidPlayToEndTimeNotification
                                               object:[audioPlayer currentItem]];
    
    [audioPlayer addObserver:self forKeyPath:@"status" options:0 context:nil];
}
    
-(void) _stop {
    if (audioPlayer) {
        [audioPlayer pause];
        audioPlayer = nil;
    }
}
 
- (void)stop:(CDVInvokedUrlCommand *)command {

    [self _stop];

    CDVPluginResult *result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:iso8601String];
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}
    
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    
    CDVPluginResult *result = nil;
    
    if (object == audioPlayer && [keyPath isEqualToString:@"status"]) {
        if (audioPlayer.status == AVPlayerStatusFailed) {
            NSLog(@"AVPlayer Failed");
            result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Error. Check for valid file."];
        }
        else if (audioPlayer.status == AVPlayerStatusReadyToPlay) {
            NSLog(@"AVPlayerStatusReadyToPlay");
            
            [audioPlayer play];
            [CDVPluginResult resultWithStatus:success ? CDVCommandStatus_OK : CDVCommandStatus_ERROR messageAsString:@"Success. File playing..."];
        }
    }
    
    if (result == nil)
        result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Error Unknown"];
    
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}
    
- (void)playerItemDidReachEnd:(NSNotification *)notification {
    
    NSLog(@"file complete");
}
    

@end
