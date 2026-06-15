import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notification_service.g.dart';

class NotificationService {
  static const _restId = 1;
  static const _chanId = 'rest_timer';
  static const _chanName = 'Rest Timer';

  final _plugin = FlutterLocalNotificationsPlugin();
  bool _initialized = false;

  Future<void> initialize() async {
    if (_initialized) return;
    await _plugin.initialize(
      settings: const InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'),
        iOS: DarwinInitializationSettings(),
      ),
    );
    _initialized = true;
  }

  Future<void> showRestComplete(int durationSeconds) async {
    await initialize();
    await _plugin.show(
      id: _restId,
      title: 'Rest Complete',
      body: 'Your ${durationSeconds}s rest is done — time for the next set!',
      notificationDetails: const NotificationDetails(
        android: AndroidNotificationDetails(
          _chanId,
          _chanName,
          importance: Importance.high,
          priority: Priority.high,
          playSound: true,
        ),
        iOS: DarwinNotificationDetails(
          presentAlert: true,
          presentSound: true,
        ),
      ),
    );
  }

  Future<void> cancelRest() => _plugin.cancel(id: _restId);
}

@Riverpod(keepAlive: true)
NotificationService notificationService(Ref ref) => NotificationService();
