import SwiftUI
import LocalAuthentication

class SecurityManager: ObservableObject {
    @Published var isUnlocked = false
    
    func lock() {
        isUnlocked = false
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
            context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: "Authenticate to access your Milli account") { success, _ in
                DispatchQueue.main.async {
                    self.isUnlocked = success
                }
            }
        }
    }
}