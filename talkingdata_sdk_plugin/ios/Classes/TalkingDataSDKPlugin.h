#import <Flutter/Flutter.h>

@interface TalkingDataSDKPlugin : NSObject<FlutterPlugin>
/// SDK初始化
+ (void)init:(NSString*)appId channelId:(NSString*)channelId custom:(NSString *)custom;
@end
