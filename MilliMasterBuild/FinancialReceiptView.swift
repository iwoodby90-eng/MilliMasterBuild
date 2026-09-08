import SwiftUI

struct FinancialReceiptView: View {
    let payout: Payout
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                VStack(spacing: 8) {
                    Text(payout.sourcePlatform.uppercased())
                        .font(MilliFont.inter(size: 10, weight: .bold))
                        .foregroundColor(.gray)
                    Text(payout.amount, format: .currency(code: "USD"))
                        .font(MilliFont.sora(size: 48, weight: .black))
                        .monospacedDigit()
                }
                .padding(.top, 20)
                
                VStack(spacing: 16) {
                    receiptRow(label: "Gross Payout", value: payout.amount)
                    receiptRow(label: "Taxes", value: payout.taxWithheld, color: MilliColors.error)
                    receiptRow(label: "Retirement", value: payout.retirementAllocation)
                    receiptRow(label: "Investing", value: payout.investingAllocation)
                    receiptRow(label: "Savings", value: payout.savingsAllocation)
                    
                    Divider().background(MilliColors.glass)
                    
                    receiptRow(label: "Available", value: payout.availableToSpend, isTotal: true)
                }
                .padding(24)
                .background(MilliColors.carbon)
                .cornerRadius(MilliTokens.radius)
                
                VStack(alignment: .leading, spacing: 12) {
                    metaRow(label: "Receipt ID", value: payout.id.uuidString.prefix(8).uppercased())
                    metaRow(label: "Date", value: payout.date.formatted(date: .abbreviated, time: .shortened))
                    metaRow(label: "Status", value: payout.status.uppercased())
                    metaRow(label: "Provenance", value: payout.provenance.uppercased())
                }
                .padding(24)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(MilliColors.carbon)
                .cornerRadius(MilliTokens.radius)
            }
            .padding(24)
        }
        .background(MilliColors.obsidian.ignoresSafeArea())
    }
    
    private func receiptRow(label: String, value: Double?, color: Color = .white, isTotal: Bool = false) -> some View {
        HStack {
            Text(label).font(MilliFont.inter(size: 14, weight: isTotal ? .bold : .regular))
            Spacer()
            if let val = value {
                Text(val, format: .currency(code: "USD"))
                    .font(MilliFont.sora(size: 14, weight: isTotal ? .black : .medium))
                    .foregroundColor(isTotal ? .white : color)
            } else {
                Text("UNAVAILABLE")
                    .font(MilliFont.inter(size: 10, weight: .bold))
                    .foregroundColor(.gray)
            }
        }
    }
    
    private func metaRow(label: String, value: String) -> some View {
        HStack {
            Text(label).font(MilliFont.inter(size: 12, weight: .bold)).foregroundColor(.gray)
            Spacer()
            Text(value).font(MilliFont.inter(size: 12, weight: .medium))
        }
    }
}