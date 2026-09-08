import SwiftUI

struct MilliFinancialCard: View {
    let payout: Payout
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text(payout.sourcePlatform.uppercased())
                    .font(.system(size: 10, weight: .bold, design: .monospaced))
                    .foregroundColor(.gray)
                Spacer()
                Text(payout.date, style: .date)
                    .font(.system(size: 10, design: .monospaced))
                    .foregroundColor(.gray)
            }
            
            Text(payout.amount, format: .currency(code: "USD"))
                .font(.system(size: 28, weight: .black, design: .monospaced))
                .foregroundColor(.white)
        }
        .padding(20)
        .background(MilliColors.carbon)
        .cornerRadius(16)
        .overlay(RoundedRectangle(cornerRadius: 16).stroke(MilliColors.electricCyan.opacity(0.2), lineWidth: 1))
    }
}