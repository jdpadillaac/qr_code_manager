import Flutter
import UIKit
import LocalAuthentication

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      let flutterCtr = window?.rootViewController as? FlutterViewController
      let channel = FlutterMethodChannel(name: "biometic_auth", binaryMessenger: (flutterCtr?.binaryMessenger)! )
        channel.setMethodCallHandler { (call, result) in
            if call.method == "validateBiometric" {
                self.auth(result: result)
            }
        }
        
      GeneratedPluginRegistrant.register(with: self)
      return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
    private func auth(result: @escaping FlutterResult ) -> Void {
        var laContextError: NSError?
        let laContext = LAContext()
        if  laContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &laContextError) {
            laContext.evaluatePolicy(
                .deviceOwnerAuthenticationWithBiometrics,
                localizedReason: "Autenticate con FaceID")
            { authSuccess,authErr in
                if (authSuccess) {
                    result(true)
                } else {
                    result(false)
                }
            }
            
        } else {
            result(false)
        }
        
    }
}
