import SwiftUI
import SwiftData

@MainActor
class MilliViewModel: ObservableObject {
    @Published var totalBalance: Double = 0.0
    @Published var taxVaultBalance: Double = 0.0
    
    var growthPercentage: Double { 12.4 }
    
    func updateBalances(from payouts: [Payout]) {
        self.totalBalance = payouts.reduce(0) { $0 + $1.amount }
        self.taxVaultBalance = payouts.reduce(0) { $0 + $1.taxWithheld }
    }
    
    func processPayout(amount: Double, source: String, context: ModelContext) {
        // 20% tax withholding logic
        let taxAmount = amount * 0.20
        let netPayout = amount - taxAmount
        
        let payout = Payout(amount: netPayout, date: Date(), status: .completed, source: source, tax: taxAmount)
        context.insert(payout)
        
        // Update local state
        self.taxVaultBalance += taxAmount
        self.totalBalance += netPayout
    }
}