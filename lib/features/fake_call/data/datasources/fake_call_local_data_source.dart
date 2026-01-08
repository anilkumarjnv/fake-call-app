import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:fake_call_app/features/fake_call/data/models/fake_call_model.dart';

abstract class FakeCallLocalDataSource {
  Future<void> scheduleFakeCall(FakeCallModel fakeCall);
  Future<void> startFakeCall(FakeCallModel fakeCall);
  Future<void> endFakeCall();
}

class FakeCallLocalDataSourceImpl implements FakeCallLocalDataSource {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  final AudioPlayer audioPlayer;

  FakeCallLocalDataSourceImpl({
    required this.flutterLocalNotificationsPlugin,
    required this.audioPlayer,
  });

  @override
  Future<void> scheduleFakeCall(FakeCallModel fakeCall) async {
    const androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'fake_call_channel',
      'Fake Call Channel',
      channelDescription: 'Channel for fake call notifications',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: false,
      fullScreenIntent: true,
    );
    const notificationDetails =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      fakeCall.callerName,
      'Incoming Call',
      fakeCall.callTime,
      notificationDetails,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      payload: 'fake_call',
    );
  }

  @override
  Future<void> startFakeCall(FakeCallModel fakeCall) async {
    await audioPlayer.play(AssetSource('sounds/ringtone.mp3'));
  }

  @override
  Future<void> endFakeCall() async {
    await audioPlayer.stop();
    await flutterLocalNotificationsPlugin.cancel(0);
  }
}
