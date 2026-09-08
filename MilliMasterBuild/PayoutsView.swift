import SwiftUI
import SwiftData

struct PayoutsView: View {
    @Query(sort: \Payout.date, order: .reverse) private var payouts: [Payout]
    @State private var selectedFilter: String = "All"
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // Summary Header
                HStack(spacing: 20) {
                    summaryItem(title: "TOTAL", value: "$12,450")
                    summaryItem(title: "PENDING", value: "$420")
                }
                .padding(24)
                .background(MilliColors.carbon)
                
                ScrollView {
                    LazyVStack(spacing: 12) {
                        ForEach(payouts) { payout in
                            NavigationLink(destination: FinancialReceiptView(payout: payout)) {
                                PayoutRow(payout: payout)
                            }
                        }
                    }
                    .padding(24)
                }
            }
            .background(MilliColors.obsidian.ignoresSafeArea())
            .navigationTitle("PAYOUTS")
            .toolbarColorScheme(.dark, for: .navigationBar)
        }
    }
    
    private func summaryItem(title: String, value: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title).font(MilliFont.inter(size: 9, weight: .bold)).foregroundColor(.gray)
            Text(value).font(MilliFont.sora(size: 20, weight: .black)).foregroundColor(.white)
        }
    }
}