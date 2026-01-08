import 'package:fake_call_app/features/fake_call/data/datasources/fake_call_local_data_source.dart';
import 'package:fake_call_app/features/fake_call/data/models/fake_call_model.dart';
import 'package:fake_call_app/features/fake_call/domain/entities/fake_call.dart';
import 'package:fake_call_app/features/fake_call/domain/repositories/fake_call_repository.dart';

class FakeCallRepositoryImpl implements FakeCallRepository {
  final FakeCallLocalDataSource localDataSource;

  FakeCallRepositoryImpl({required this.localDataSource});

  @override
  Future<void> scheduleFakeCall(FakeCall fakeCall) async {
    final fakeCallModel = FakeCallModel.fromEntity(fakeCall);
    await localDataSource.scheduleFakeCall(fakeCallModel);
  }

  @override
  Future<void> startFakeCall(FakeCall fakeCall) async {
    final fakeCallModel = FakeCallModel.fromEntity(fakeCall);
    await localDataSource.startFakeCall(fakeCallModel);
  }

  @override
  Future<void> endFakeCall() async {
    await localDataSource.endFakeCall();
  }
}
