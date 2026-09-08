import LocalAuthentication
import SwiftUI

class SecurityManager: ObservableObject {
    @Published var isAuthenticated = false
    @Published var authError: String?
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        // Use deviceOwnerAuthentication to allow fallback to passcode if biometrics fail
        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
            let reason = "Milli requires authentication to access your financial data."
            
            context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason) { success, error in
                DispatchQueue.main.async {
                    if success {
                        self.isAuthenticated = true
                        self.authError = nil
                    } else {
                        self.isAuthenticated = false
                        self.authError = error?.localizedDescription ?? "Authentication failed"
                    }
                }
            }
        } else {
            self.authError = "Biometrics/Passcode not available"
        }
    }
    
    func lock() {
        isAuthenticated = false
    }
}