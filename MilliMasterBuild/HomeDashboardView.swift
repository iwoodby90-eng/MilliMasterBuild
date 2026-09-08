import SwiftUI
import SwiftData

struct HomeDashboardView: View {
    @Query(sort: \Payout.date, order: .reverse) private var payouts: [Payout]
    @StateObject private var viewModel = MilliViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Header
                HStack {
                    Text("MILLI").font(.system(size: 12, weight: .black, design: .monospaced)).tracking(4)
                    Spacer()
                    Image(systemName: "bell.badge").foregroundColor(MilliColors.electricCyan)
                }
                .padding(.top)
                
                // Primary Balance
                VStack(alignment: .leading, spacing: 4) {
                    Text("AVAILABLE TO SPEND").font(.system(size: 10, weight: .bold, design: .monospaced)).foregroundColor(.gray)
                    Text(viewModel.totalBalance, format: .currency(code: "USD"))
                        .font(.system(size: 44, weight: .black, design: .monospaced))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                // Latest Payout
                if let latest = payouts.first {
                    VStack(alignment: .leading, spacing: 12) {
                        Text("LATEST PAYOUT").font(.system(size: 10, weight: .bold, design: .monospaced)).foregroundColor(.gray)
                        MilliFinancialCard(payout: latest)
                    }
                }
                
                // Metrics
                VStack(alignment: .leading, spacing: 12) {
                    Text("INSIGHTS").font(.system(size: 10, weight: .bold, design: .monospaced)).foregroundColor(.gray)
                    MilliMetricCard(title: "TAX VAULT", value: "$4,200.00", status: "ON TRACK")
                }
                
                // Quick Actions
                HStack(spacing: 16) {
                    Button(action: {}) {
                        Label("Transfer", systemImage: "arrow.left.arrow.right")
                            .font(.system(size: 12, weight: .bold, design: .monospaced))
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(MilliColors.carbon)
                            .cornerRadius(12)
                    }
                    Button(action: {}) {
                        Label("Deposit", systemImage: "plus")
                            .font(.system(size: 12, weight: .bold, design: .monospaced))
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(MilliColors.carbon)
                            .cornerRadius(12)
                    }
                }
                .foregroundColor(.white)
            }
            .padding(24)
            .padding(.bottom, 100)
        }
        .background(MilliColors.obsidian.ignoresSafeArea())
        .onAppear {
            viewModel.updateBalance(from: payouts)
        }
        .refreshable {
            viewModel.updateBalance(from: payouts)
        }
    }
}