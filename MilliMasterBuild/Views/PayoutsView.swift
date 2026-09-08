import SwiftUI
import SwiftData

struct PayoutsView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Payout.date, order: .reverse) private var payouts: [Payout]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(payouts) { payout in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(payout.sourcePlatform)
                                .font(.headline)
                            Text(payout.date, style: .date)
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        Text("+\(payout.amount, format: .currency(code: "USD"))")
                            .font(.system(.body, design: .monospaced).bold())
                            .foregroundColor(MilliColors.electricCyan)
                    }
                    .listRowBackground(MilliColors.carbon)
                }
            }
            .scrollContentBackground(.hidden)
            .background(MilliColors.obsidian)
            .navigationTitle("Payouts")
            .toolbarColorScheme(.dark, for: .navigationBar)
        }
    }
}