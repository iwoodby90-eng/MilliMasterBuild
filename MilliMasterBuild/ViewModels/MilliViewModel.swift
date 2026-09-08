import Foundation
import SwiftData

@MainActor
class MilliViewModel: ObservableObject {
    @Published var totalBalance: Double = 0.0
    
    func updateBalance(from payouts: [Payout]) {
        self.totalBalance = payouts.reduce(0) { $0 + $1.amount }
    }
}