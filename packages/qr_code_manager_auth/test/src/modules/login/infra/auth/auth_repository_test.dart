import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:qr_code_manager_auth/src/modules/login/infra/auth/auth_repository.dart';
import 'package:qr_code_manager_auth/src/shared/domain/entity/user.dart';
import 'package:qr_code_manager_auth/src/shared/infra/drift/user_db.dart';

import 'auth_repository_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<DriftUserDataBase>(),
  MockSpec<FlutterSecureStorage>(),
  MockSpec<DriftUser>(),
])
void main() {
  late DriftUserDataBase mockDriftUserDataBase;
  late FlutterSecureStorage mockFlutterSecureStorage;
  late AppAuthRepository authRepository;

  setUp(() {
    mockDriftUserDataBase = MockDriftUserDataBase();
    mockFlutterSecureStorage = MockFlutterSecureStorage();
    authRepository = AppAuthRepository(
      driftUserDataBase: mockDriftUserDataBase,
      flutterSecureStorage: mockFlutterSecureStorage,
    );
  });

  group('isUserPreviousliAunthenticated', () {
    test('returns Some(Exception) when user is authenticated', () async {
      when(
        mockFlutterSecureStorage.read(key: 'authenticated_user'),
      ).thenAnswer((_) async => null);

      final result = await authRepository.isUserPreviousliAunthenticated();

      expect(result.isSome(), true);
      expect(result.unwrap(), isA<Exception>());
    });

    test('returns None when user is not authenticated', () async {
      when(
        mockFlutterSecureStorage.read(key: 'authenticated_user'),
      ).thenAnswer((_) async => 'test@example.com');

      final result = await authRepository.isUserPreviousliAunthenticated();

      expect(result.isNone(), true);
    });
  });

  group('saveAuth', () {
    test('returns None when save is successful', () async {
      const user = User(
        email: 'test@example.com',
        password: 'password',
        userName: 'testuser',
        enableBiometricAuth: true,
      );

      when(
        mockFlutterSecureStorage.write(
          key: 'authenticated_user',
          value: user.email,
        ),
      ).thenAnswer((_) async {
        return;
      });

      final result = await authRepository.saveAuth(user: user);

      expect(result.isNone(), true);
    });

    test('returns Some(Exception) when save fails', () async {
      const user = User(
        email: 'test@example.com',
        password: 'password',
        userName: 'testuser',
        enableBiometricAuth: true,
      );

      when(
        mockFlutterSecureStorage.write(
          key: 'authenticated_user',
          value: user.email,
        ),
      ).thenThrow(Exception('Failed to save'));

      final result = await authRepository.saveAuth(user: user);

      expect(result.isSome(), true);
      expect(result.unwrap(), isA<Exception>());
    });
  });
}
