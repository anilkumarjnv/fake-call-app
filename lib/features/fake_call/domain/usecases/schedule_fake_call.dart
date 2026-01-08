import 'package:fake_call_app/features/fake_call/domain/entities/fake_call.dart';
import 'package:fake_call_app/features/fake_call/domain/repositories/fake_call_repository.dart';

class ScheduleFakeCall {
  final FakeCallRepository repository;

  ScheduleFakeCall(this.repository);

  Future<void> call(FakeCall fakeCall) async {
    return await repository.scheduleFakeCall(fakeCall);
  }
}
