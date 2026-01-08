import 'package:fake_call_app/features/fake_call/data/datasources/fake_call_local_data_source.dart';
import 'package:fake_call_app/features/fake_call/data/repositories/fake_call_repository_impl.dart';
import 'package:fake_call_app/features/fake_call/domain/entities/fake_call.dart';
import 'package:fake_call_app/features/fake_call/domain/repositories/fake_call_repository.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Data Source Provider
final fakeCallLocalDataSourceProvider = Provider<FakeCallLocalDataSource>((ref) {
  return FakeCallLocalDataSourceImpl(
    flutterLocalNotificationsPlugin: FlutterLocalNotificationsPlugin(),
    audioPlayer: AudioPlayer(),
  );
});

// Repository Provider
final fakeCallRepositoryProvider = Provider<FakeCallRepository>((ref) {
  final localDataSource = ref.watch(fakeCallLocalDataSourceProvider);
  return FakeCallRepositoryImpl(localDataSource: localDataSource);
});

// Use Case Providers
final scheduleFakeCallProvider = Provider<Future<void> Function(FakeCall)>((ref) {
  final repository = ref.watch(fakeCallRepositoryProvider);
  return repository.scheduleFakeCall;
});

final startFakeCallProvider = Provider<Future<void> Function(FakeCall)>((ref) {
  final repository = ref.watch(fakeCallRepositoryProvider);
  return repository.startFakeCall;
});

final endFakeCallProvider = Provider<Future<void> Function()>((ref) {
  final repository = ref.watch(fakeCallRepositoryProvider);
  return repository.endFakeCall;
});
