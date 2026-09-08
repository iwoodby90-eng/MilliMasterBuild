import SwiftUI

struct MilliMetricCard: View {
    let title: String
    let value: String
    let status: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(title).font(.system(size: 10, weight: .bold, design: .monospaced)).foregroundColor(.gray)
                Text(value).font(.system(size: 20, weight: .black, design: .monospaced))
            }
            Spacer()
            Text(status)
                .font(.system(size: 10, weight: .bold, design: .monospaced))
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .background(MilliColors.electricCyan.opacity(0.1))
                .foregroundColor(MilliColors.electricCyan)
                .cornerRadius(4)
        }
        .padding(20)
        .background(MilliColors.carbon)
        .cornerRadius(16)
    }
}