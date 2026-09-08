import SwiftUI
import SwiftData

struct HomeDashboardView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Payout.date, order: .reverse) private var payouts: [Payout]
    @Query private var mileageEntries: [MileageEntry]
    @StateObject private var viewModel = MilliViewModel()
    @StateObject private var aiViewModel = MilliAIViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Header
                HStack {
                    Text("MILLI AI")
                        .font(.system(size: 10, weight: .bold, design: .monospaced))
                        .tracking(2)
                        .foregroundColor(MilliColors.electricCyan)
                    Spacer()
                    Image(systemName: "person.crop.circle.badge.shield.checkmark")
                        .foregroundColor(.gray)
                }
                .padding(.top, 60)
                .padding(.horizontal)
                
                // Balance Card
                VStack(spacing: 8) {
                    Text("TOTAL BALANCE")
                        .font(.system(size: 12, weight: .medium, design: .rounded))
                        .foregroundColor(.gray)
                    Text("$\(viewModel.totalBalance, specifier: "%.2f")")
                        .font(.system(size: 52, weight: .black, design: .rounded))
                        .foregroundColor(.white)
                        .contentTransition(.numericText())
                }
                .padding(.vertical, 40)
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 32).fill(MilliColors.carbon.opacity(0.5)))
                .overlay(RoundedRectangle(cornerRadius: 32).stroke(MilliColors.electricCyan.opacity(0.1), lineWidth: 1))
                .padding(.horizontal)
                
                // Insight Card
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Image(systemName: "sparkles")
                        Text("Milli Insight")
                            .font(.caption.bold())
                    }
                    .foregroundColor(MilliColors.electricCyan)
                    
                    Text(aiViewModel.insight)
                        .font(.system(.subheadline, design: .rounded))
                        .foregroundColor(.white.opacity(0.9))
                        .lineSpacing(4)
                }
                .padding(20)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(RoundedRectangle(cornerRadius: 24).fill(MilliColors.carbon))
                .padding(.horizontal)
            }
        }
        .background(MilliColors.obsidian.ignoresSafeArea())
        .task {
            viewModel.updateBalance(from: payouts)
            await aiViewModel.triggerMilliInsight(payouts: payouts, mileageEntries: mileageEntries)
        }
    }
}