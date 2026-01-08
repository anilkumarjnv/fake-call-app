import 'package:fake_call_app/features/fake_call/domain/entities/fake_call.dart';

abstract class FakeCallRepository {
  Future<void> scheduleFakeCall(FakeCall fakeCall);
  Future<void> startFakeCall(FakeCall fakeCall);
  Future<void> endFakeCall();
}
