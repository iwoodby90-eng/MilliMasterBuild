import SwiftUI
import SwiftData

struct PayoutsView: View {
    @Query(sort: \Payout.date, order: .reverse) private var payouts: [Payout]
    
    var body: some View {
        NavigationStack {
            List(payouts) { payout in
                HStack {
                    VStack(alignment: .leading) {
                        Text(payout.sourcePlatform)
                            .font(.system(.body, design: .rounded).bold())
                            .foregroundColor(.white)
                        Text(payout.date, style: .date)
                            .font(.system(size: 12, design: .monospaced))
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    Text(payout.amount, format: .currency(code: "USD"))
                        .font(.system(.body, design: .monospaced).bold())
                        .foregroundColor(MilliColors.electricCyan)
                }
                .listRowBackground(MilliColors.carbon.opacity(0.5))
            }
            .scrollContentBackground(.hidden)
            .background(MilliColors.obsidian)
            .navigationTitle("PAYOUTS")
            .toolbarColorScheme(.dark, for: .navigationBar)
        }
    }
}