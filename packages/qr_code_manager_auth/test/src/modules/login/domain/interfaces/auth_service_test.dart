import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:oxidized/oxidized.dart';
import 'package:qr_code_manager_auth/src/modules/login/domain/domain.dart';

import 'auth_service_test.mocks.dart';

@GenerateNiceMocks([MockSpec<AuthService>()])
void main() {
  provideDummy<Result<bool, Exception>>(const Result.ok(true));
  provideDummy<Result<bool, Exception>>(Result.err(Exception('e')));
  provideDummy<Option<Exception>>(Some(Exception('e')));

  late AuthService mockAuthService;

  setUp(() {
    mockAuthService = MockAuthService();
  });

  group('AuthService', () {
    test('recoverlogin returns Result<bool, Exception>', () async {
      // Arrange
      when(
        mockAuthService.recoverlogin(),
      ).thenAnswer((_) async => const Result.ok(true));

      // Act
      final result = await mockAuthService.recoverlogin();

      // Assert
      expect(result.isOk(), true);
      expect(result.unwrap(), true);
    });

    test('login returns Option<Exception>', () async {
      // Arrange
      const emailOrUserName = 'test@example.com';
      const password = 'password123';
      when(
        mockAuthService.login(
          emailOrUserName: emailOrUserName,
          password: password,
        ),
      ).thenAnswer((_) async => const Option.none());

      // Act
      final result = await mockAuthService.login(
        emailOrUserName: emailOrUserName,
        password: password,
      );

      // Assert
      expect(result.isNone(), true);
    });

    test('login returns Option<Exception> with error', () async {
      // Arrange
      const emailOrUserName = 'test@example.com';
      const password = 'password123';
      final exception = Exception('Login failed');
      when(
        mockAuthService.login(
          emailOrUserName: emailOrUserName,
          password: password,
        ),
      ).thenAnswer((_) async => Option.some(exception));

      // Act
      final result = await mockAuthService.login(
        emailOrUserName: emailOrUserName,
        password: password,
      );

      // Assert
      expect(result.isSome(), true);
      expect(result.unwrap(), exception);
    });
  });
}
