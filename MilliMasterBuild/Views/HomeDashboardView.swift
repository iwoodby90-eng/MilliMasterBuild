import SwiftUI
import SwiftData

struct HomeDashboardView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Payout.date, order: .reverse) private var payouts: [Payout]
    @StateObject private var viewModel = MilliViewModel()
    @StateObject private var aiViewModel = MilliAIViewModel()
    
    var body: some View {
        VStack(spacing: 24) {
            Text("MILLI AI")
                .font(.system(size: 10, weight: .bold, design: .monospaced))
                .foregroundColor(MilliColors.electricCyan)
                .padding(.top, 60)
            
            // AI Insight Card
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Image(systemName: "sparkles")
                    Text("Milli Insight")
                        .font(.caption.bold())
                }
                .foregroundColor(MilliColors.electricCyan)
                
                Text(aiViewModel.insight)
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.8))
                    .fixedSize(horizontal: false, vertical: true)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(MilliColors.carbon.opacity(0.8))
            .cornerRadius(16)
            .padding(.horizontal)
            
            VStack(spacing: 8) {
                Text("TOTAL BALANCE")
                    .font(.system(size: 10, weight: .medium, design: .rounded))
                    .foregroundColor(.gray)
                Text("$\(viewModel.totalBalance, specifier: "%.2f")")
                    .font(.system(size: 42, weight: .black, design: .rounded))
                    .foregroundColor(.white)
            }
            
            // ... (Rest of the view remains same)
            Spacer()
        }
        .task {
            await aiViewModel.generateInsight(from: payouts, totalBalance: viewModel.totalBalance)
        }
    }
}