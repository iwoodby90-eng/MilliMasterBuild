import SwiftUI
import SwiftData

@MainActor
class MilliAIViewModel: ObservableObject {
    @Published var insight: String = "Scanning financial vitals..."
    @Published var isProcessing = false
    @Published var showMilliOverlay = false
    @Published var mood: String = "neutral" 

    func triggerEventInsight(event: String) {
        self.showMilliOverlay = true
        switch event {
        case "tree_milestone":
            self.insight = "Growth detected. Your financial roots are expanding. Excellent efficiency."
            self.mood = "excited"
        default:
            self.insight = "System analysis complete. All parameters within optimal range."
            self.mood = "neutral"
        }
    }

    func triggerMilliInsight(payouts: [Payout], mileageEntries: [MileageEntry]) async {
        isProcessing = true
        showMilliOverlay = true
        
        try? await Task.sleep(for: .seconds(1.5))
        
        let totalMileage = mileageEntries.reduce(0) { $0 + $1.distance }
        
        if totalMileage > 500 {
            self.insight = "High mobility detected. Your mileage deductions are currently optimized for maximum tax efficiency."
            self.mood = "excited"
        } else {
            self.insight = "Monitoring your liquidity. Everything is balanced and secure."
            self.mood = "neutral"
        }
        
        isProcessing = false
    }
    
    func dismiss() {
        withAnimation(.easeOut) { showMilliOverlay = false }
    }
}