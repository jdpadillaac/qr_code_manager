//
//  QrCodeScannerApi.swift
//  Runner
//
//  Created by Jonatan Padilla on 23/02/25.
//

class QrCodeScannerApi: QrScannerNativeApi {
    private var viewController: UIViewController
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    
    func scanQrCode(completion: @escaping (Result<String?, any Error>) -> Void) {
        let scannerVC = QrCodeScannerView()
        scannerVC.onQRCodeScanned = { result in
            completion(Result.success(result))
        }
        self.viewController.present(scannerVC, animated: true, completion: nil)
        
    }
    
    
    
}
