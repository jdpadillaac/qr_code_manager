package com.example.qr_code_manager

import android.hardware.fingerprint.FingerprintManager
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine


class MainActivity : FlutterActivity() {

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        AuthNaviteApi.setUp(flutterEngine.dartExecutor.binaryMessenger, AppBiometricAuthApi(this, this ))
    }
}

