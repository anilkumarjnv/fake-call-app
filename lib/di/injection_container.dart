import 'package:fake_call_app/features/fake_call/domain/repositories/fake_call_repository.dart';
import 'package:fake_call_app/features/fake_call/domain/usecases/end_fake_call.dart';
import 'package:fake_call_app/features/fake_call/domain/usecases/schedule_fake_call.dart';
import 'package:fake_call_app/features/fake_call/domain/usecases/start_fake_call.dart';

// This is a placeholder for the actual dependency injection setup.
// In a real app, you would use a service locator like GetIt or Riverpod to register and retrieve your dependencies.

class InjectionContainer {
  // Use Cases
  late final ScheduleFakeCall scheduleFakeCall;
  late final StartFakeCall startFakeCall;
  late final EndFakeCall endFakeCall;

  // Repositories
  late final FakeCallRepository fakeCallRepository;

  void init() {
    // Initialize your dependencies here
  }
}
