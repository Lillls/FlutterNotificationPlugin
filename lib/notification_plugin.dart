import 'dart:async';

import 'package:flutter/services.dart';

class NotificationPlugin {
  static const MethodChannel _channel =
  const MethodChannel('flutter_notification_plugin');

  //每天定时提醒
  static Future init(int hour, int minute) async {
    return await _channel.invokeMethod('init', {
      "hour": hour,
      "minute": minute,
    });
  }
}
