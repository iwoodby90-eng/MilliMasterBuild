import SwiftUI

struct FinancialReceiptView: View {
    let payout: Payout
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Header
                VStack(spacing: 8) {
                    Text(payout.sourcePlatform.uppercased())
                        .font(MilliFont.inter(size: 10, weight: .bold))
                        .foregroundColor(.gray)
                    Text(payout.amount, format: .currency(code: "USD"))
                        .font(MilliFont.sora(size: 48, weight: .black))
                        .monospacedDigit()
                }
                .padding(.top, 20)
                
                // Breakdown
                VStack(spacing: 16) {
                    receiptRow(label: "Gross Payout", value: payout.amount)
                    receiptRow(label: "Taxes", value: -payout.taxWithheld, color: MilliColors.error)
                    receiptRow(label: "Retirement", value: 0.0)
                    receiptRow(label: "Investing", value: 0.0)
                    receiptRow(label: "Savings", value: 0.0)
                    
                    Divider().background(MilliColors.glass)
                    
                    receiptRow(label: "Available", value: payout.amount - payout.taxWithheld, isTotal: true)
                }
                .padding(24)
                .background(MilliColors.carbon)
                .cornerRadius(MilliTokens.radius)
                
                // Metadata
                VStack(alignment: .leading, spacing: 12) {
                    metaRow(label: "Receipt ID", value: payout.id.uuidString.prefix(8).uppercased())
                    metaRow(label: "Date", value: payout.date.formatted(date: .abbreviated, time: .shortened))
                    metaRow(label: "Status", value: payout.status.uppercased())
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
    
    private func receiptRow(label: String, value: Double, color: Color = .white, isTotal: Bool = false) -> some View {
        HStack {
            Text(label).font(MilliFont.inter(size: 14, weight: isTotal ? .bold : .regular))
            Spacer()
            Text(value, format: .currency(code: "USD"))
                .font(MilliFont.sora(size: 14, weight: isTotal ? .black : .medium))
                .foregroundColor(color)
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