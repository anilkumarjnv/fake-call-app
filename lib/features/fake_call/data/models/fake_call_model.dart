import 'package:fake_call_app/features/fake_call/domain/entities/fake_call.dart';
import 'package:timezone/timezone.dart' as tz;

class FakeCallModel extends FakeCall {
  const FakeCallModel({required super.callerName, required super.callTime});

  factory FakeCallModel.fromEntity(FakeCall entity) {
    return FakeCallModel(
      callerName: entity.callerName,
      callTime: entity.callTime,
    );
  }

  factory FakeCallModel.fromJson(Map<String, dynamic> json) {
    return FakeCallModel(
      callerName: json['callerName'],
      callTime: tz.TZDateTime.parse(tz.local, json['callTime']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'callerName': callerName,
      'callTime': callTime.toIso8601String(),
    };
  }
}
