import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:oxidized/oxidized.dart';
import 'package:qr_code_manager_auth/src/modules/login/domain/interfaces/auth_repo.dart';
import 'package:qr_code_manager_auth/src/shared/domain/entity/user.dart';

import 'auth_repo_test.mocks.dart';

@GenerateNiceMocks([MockSpec<AuthenticationRepo>()])
void main() {
  provideDummy<Option<bool>>(const None());
  provideDummy<Option<Exception>>(Some(Exception('e')));
  provideDummy<Result<User, Exception>>(Result.err(Exception('e')));
  provideDummy<Result<User, Exception>>(
    const Result.ok(
      User(
        userName: 'Test User',
        email: 'test@example.com',
        enableBiometricAuth: true,
        password: '',
      ),
    ),
  );

  late AuthenticationRepo mockAuthenticationRepo;

  setUp(() {
    mockAuthenticationRepo = MockAuthenticationRepo();
  });

  group('AuthenticationRepo', () {
    test(
      'isUserPreviouslyAuthenticated returns an Option<Exception>',
      () async {
        when(
          mockAuthenticationRepo.isUserPreviousliAunthenticated(),
        ).thenAnswer((_) async => const Option.none());

        final result =
            await mockAuthenticationRepo.isUserPreviousliAunthenticated();

        expect(result.isNone(), true);
      },
    );

    test('saveAuth returns an Option<Exception>', () async {
      const user = User(
        userName: 'Test User',
        email: 'test@example.com',
        enableBiometricAuth: true,
        password: '',
      );
      when(
        mockAuthenticationRepo.saveAuth(user: user),
      ).thenAnswer((_) async => const Option.none());

      final result = await mockAuthenticationRepo.saveAuth(user: user);

      expect(result.isNone(), true);
    });

    test('authenticate returns a Result<User, Exception>', () async {
      const user = User(
        userName: 'Test User',
        email: 'test@example.com',
        enableBiometricAuth: true,
        password: '',
      );
      when(
        mockAuthenticationRepo.authenticate(
          emailOrUserName: 'test@example.com',
          password: 'password',
        ),
      ).thenAnswer((_) async => const Result.ok(user));

      final result = await mockAuthenticationRepo.authenticate(
        emailOrUserName: 'test@example.com',
        password: 'password',
      );

      expect(result.isOk(), true);
      expect(result.unwrap(), user);
    });
  });
}
