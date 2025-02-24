import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:oxidized/oxidized.dart';
import 'package:qr_code_manager_auth/src/modules/login/domain/interfaces/biometric_manager.dart';

import 'biometric_manager_test.mocks.dart';

@GenerateNiceMocks([MockSpec<BiometricManager>()])
void main() {
  group('BiometricManager', () {
    provideDummy<Result<bool, Exception>>(const Result.ok(true));
    provideDummy<Result<bool, Exception>>(Result.err(Exception('e')));
    provideDummy<Option<Exception>>(Some(Exception('e')));

    late BiometricManager mockBiometricManager;

    setUp(() {
      mockBiometricManager = MockBiometricManager();
    });

    group('Biometric manager', () {
      test('should return true when authentication is successful', () async {
        when(
          mockBiometricManager.authenticate(),
        ).thenAnswer((_) async => const Result.ok(true));

        final result = await mockBiometricManager.authenticate();

        expect(result.isOk(), true);
        expect(result.unwrap(), true);
      });

      test('should return an exception when authentication fails', () async {
        final exception = Exception('Authentication failed');
        when(
          mockBiometricManager.authenticate(),
        ).thenAnswer((_) async => Result.err(exception));

        final result = await mockBiometricManager.authenticate();

        expect(result.isErr(), true);
        expect(result.unwrapErr(), exception);
      });
    });
  });
}
