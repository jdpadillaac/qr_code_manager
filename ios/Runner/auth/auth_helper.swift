//
//  auth_helper.swift
//  Runner
//
//  Created by Jonatan Padilla on 23/02/25.
//
import LocalAuthentication

class AuthHelper: AuthNaviteApi {
    func aunthenticate() throws -> Bool {
        let laContext = LAContext()
           var laContextError: NSError?
           var authResult = false
           
           let semaphore = DispatchSemaphore(value: 0) // Se inicializa antes de usarse

           if laContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &laContextError) {
               laContext.evaluatePolicy(
                   .deviceOwnerAuthenticationWithBiometrics,
                   localizedReason: "Autenticate con FaceID"
               ) { authSuccess, _ in
                   authResult = authSuccess
                   semaphore.signal()
               }
               semaphore.wait() 
           } else {
               authResult = false
           }
           
           return authResult
    }
    
  
    
}
