import 'package:fake_call_app/features/fake_call/domain/repositories/fake_call_repository.dart';

class EndFakeCall {
  final FakeCallRepository repository;

  EndFakeCall(this.repository);

  Future<void> call() async {
    return await repository.endFakeCall();
  }
}
