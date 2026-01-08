import 'package:equatable/equatable.dart';
import 'package:timezone/timezone.dart' as tz;

class FakeCall extends Equatable {
  final String callerName;
  final tz.TZDateTime callTime;

  const FakeCall({required this.callerName, required this.callTime});

  @override
  List<Object?> get props => [callerName, callTime];
}
