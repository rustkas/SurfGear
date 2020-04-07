import 'package:flutter/cupertino.dart';
import 'package:push/push.dart';

/// abstract notification processing strategy
abstract class PushHandleStrategy<PT extends NotificationPayload> {
  PushHandleStrategy(this.payload);

  /// android chanel setting
  String notificationChannelId = 'default_push_chanel_id';
  String notificationChannelName = 'Chanel name';
  String notificationDescription = 'Chanel description';

  /// push id
  int pushId = 0;

  /// non-removable notification
  /// Android only
  bool ongoing = false;

  /// Indicates if a sound should be played when the notification is displayed.
  bool playSound = true;

  /// Display an alert when the notification is triggered while app is in the foreground.
  /// iOS 10+ only
  bool presentAlert = true;

  /// notification payload
  final PT payload;

  /// function that is called to process notification clicks
  void onTapNotification(NavigatorState navigator);
}