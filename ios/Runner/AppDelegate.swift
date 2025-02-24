import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let flutterCtr = window?.rootViewController as? FlutterViewController
        
        AuthNaviteApiSetup.setUp(binaryMessenger:  (flutterCtr?.binaryMessenger)!, api: AuthHelper( ));
        QrScannerNativeApiSetup.setUp(binaryMessenger: (flutterCtr?.binaryMessenger)!, api: QrCodeScannerApi( viewController:  QrCodeScannerView()))
        
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
}
