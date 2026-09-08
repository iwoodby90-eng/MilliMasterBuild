import SwiftUI
import SwiftData

@MainActor
class MilliAIViewModel: ObservableObject {
    @Published var insight: String = "Ready for your next milestone..."
    @Published var isProcessing = false
    @Published var showMilliOverlay = false
    @Published var mood: String = "neutral" 

    // Triggered by specific life events or milestones
    func triggerEventInsight(event: String) {
        self.showMilliOverlay = true
        switch event {
        case "tree_milestone":
            self.insight = "Go-Go-Gadget Growth! You've reached a new milestone in your Tree of Life. Your financial roots are getting stronger!"
            self.mood = "excited"
        default:
            self.insight = "System update complete. All systems nominal."
            self.mood = "neutral"
        }
    }

    func triggerMilliInsight(payouts: [Payout], mileageEntries: [MileageEntry]) async {
        isProcessing = true
        showMilliOverlay = true
        
        try? await Task.sleep(for: .seconds(1.5))
        
        let totalMileage = mileageEntries.reduce(0) { $0 + $1.distance }
        let taxScore = calculateTaxScore(payouts: payouts)
        
        if totalMileage >= 1000 {
            self.insight = "Wowsers! You've hit 1,000 miles. That's a massive deduction potential. Keep it up!"
            self.mood = "excited"
        } else if taxScore > 90 {
            self.insight = "Go-Go-Gadget Tax Savings! Your withholding is perfectly calibrated. Excellent work."
            self.mood = "happy"
        } else {
            self.insight = "Checking the vitals... steady progress. Let's keep those miles logged."
            self.mood = "neutral"
        }
        
        isProcessing = false
    }
    
    func dismiss() {
        withAnimation(.easeOut) { showMilliOverlay = false }
    }
    
    private func calculateTaxScore(payouts: [Payout]) -> Double { return 85.0 }
}