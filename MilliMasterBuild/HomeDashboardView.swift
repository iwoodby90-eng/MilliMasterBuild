import SwiftUI
import SwiftData

struct HomeDashboardView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Payout.date, order: .reverse) private var payouts: [Payout]
    @Query private var mileageEntries: [MileageEntry]
    @StateObject private var viewModel = MilliViewModel()
    @StateObject private var aiViewModel = MilliAIViewModel()
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 24) {
                header
                balanceCard
                insightSection
            }
            .padding(.top, 20)
            .padding(.bottom, 120)
        }
        .background(MilliColors.obsidian.ignoresSafeArea())
        .task {
            viewModel.updateBalance(from: payouts)
        }
    }
    
    private var header: some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                Text("MILLI COMMAND").font(.system(size: 10, weight: .black, design: .monospaced)).tracking(4).foregroundColor(MilliColors.electricCyan)
                Text("Financial Overview").font(.system(.title2, design: .rounded).bold()).foregroundColor(.white)
            }
            Spacer()
            Image(systemName: "person.crop.circle.badge.shield.checkmark")
                .font(.title2)
                .foregroundColor(MilliColors.electricCyan)
        }
        .padding(.horizontal)
    }
    
    private var balanceCard: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("TOTAL LIQUIDITY").font(.system(size: 10, weight: .bold, design: .monospaced)).foregroundColor(.gray)
            Text(viewModel.totalBalance, format: .currency(code: "USD"))
                .font(.system(size: 42, weight: .black, design: .monospaced))
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(30)
        .background(RoundedRectangle(cornerRadius: 32).fill(MilliColors.carbon))
        .padding(.horizontal)
    }
    
    private var insightSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("AI ANALYSIS").font(.system(size: 10, weight: .bold, design: .monospaced)).foregroundColor(MilliColors.electricCyan)
            Text("Your spending velocity is 12% lower than last month. Efficiency is optimal.")
                .font(.system(.body, design: .rounded))
                .foregroundColor(.white.opacity(0.8))
        }
        .padding(24)
        .background(RoundedRectangle(cornerRadius: 24).stroke(MilliColors.electricCyan.opacity(0.2), lineWidth: 1))
        .padding(.horizontal)
    }
}