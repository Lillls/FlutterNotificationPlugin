#import "NotificationPlugin.h"
#import <notification_plugin/notification_plugin-Swift.h>

@implementation NotificationPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftNotificationPlugin registerWithRegistrar:registrar];
}
@end
