import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      let flutterCtr = window?.rootViewController as? FlutterViewController
      
      ExampleHostApiSetup.setUp(binaryMessenger:  (flutterCtr?.binaryMessenger)!, api: AuthHelper( ));
      
      let qrChannel = FlutterMethodChannel(name: "qr_scanner", binaryMessenger: (flutterCtr?.binaryMessenger)! )
      qrChannel.setMethodCallHandler { (call, result) in
            if call.method == "scanQrCode" {
                self.openCameraScanner(flutterCtr!, result: result)
            }
        }
        
      GeneratedPluginRegistrant.register(with: self)
      return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
    
    func openCameraScanner(_ viewController: UIViewController, result: @escaping FlutterResult) {
        let scannerVC = QrCodeScannerView()
        scannerVC.onQRCodeScanned = { qrCode in
            result(qrCode)
        }
        viewController.present(scannerVC, animated: true, completion: nil)
    }

}
