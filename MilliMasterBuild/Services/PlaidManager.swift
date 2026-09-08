import Foundation
import LinkKit
import SwiftData

class PlaidManager: ObservableObject {
    @Published var isConnected = false
    @Published var linkToken: String?
    
    func createLinkToken() async {
        // Simulate network call to backend
        try? await Task.sleep(for: .seconds(1))
        await MainActor.run {
            self.linkToken = "link-sandbox-milli-12345"
        }
    }
    
    func handleLinkSuccess(publicToken: String, context: ModelContext) {
        // In production, exchange publicToken for access_token via backend
        self.isConnected = true
    }
}