//
//  auth_helper.swift
//  Runner
//
//  Created by Jonatan Padilla on 23/02/25.
//
import LocalAuthentication



class AuthHelper {
    
    static func auth(result: @escaping FlutterResult ) -> Void {
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
