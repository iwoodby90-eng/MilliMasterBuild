import Foundation
import LocalAuthentication
import SwiftUI

class SecurityManager: ObservableObject {
    @Published var isAuthenticated = false
    @Published var authError: String?
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
            context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: "Unlock Milli to access your financial data") { success, error in
                DispatchQueue.main.async {
                    if success {
                        self.isAuthenticated = true
                    } else {
                        self.authError = error?.localizedDescription ?? "Authentication failed"
                    }
                }
            }
        } else {
            self.authError = "Biometrics not available"
        }
    }
    
    func lock() {
        isAuthenticated = false
    }
}