import SwiftUI
import SwiftData

struct WealthView: View {
    @Query(sort: \TaxVault.date, order: .reverse) private var taxVaults: [TaxVault]
    @State private var isAnimating = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                Text("WEALTH & TAX")
                    .font(.system(size: 12, weight: .black, design: .monospaced))
                    .tracking(6)
                    .foregroundColor(MilliColors.electricCyan)
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("TOTAL TAX SAVINGS")
                        .font(.system(size: 10, weight: .bold, design: .monospaced))
                        .foregroundColor(.gray)
                    Text("$12,450.00")
                        .font(.system(size: 40, weight: .black, design: .monospaced))
                        .foregroundColor(.white)
                }
                .padding(24)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(
                    RoundedRectangle(cornerRadius: 24)
                        .fill(MilliColors.carbon)
                        .overlay(
                            RoundedRectangle(cornerRadius: 24)
                                .stroke(MilliColors.electricCyan.opacity(isAnimating ? 0.4 : 0.1), lineWidth: 1)
                        )
                )
                .scaleEffect(isAnimating ? 1.01 : 1.0)
                
                Text("VAULT HISTORY")
                    .font(.system(size: 10, weight: .bold, design: .monospaced))
                    .foregroundColor(.gray)
                
                ForEach(taxVaults) { vault in
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(vault.name)
                                .font(.system(.body, weight: .bold, design: .monospaced))
                            Text(vault.date, style: .date)
                                .font(.system(size: 10, design: .monospaced))
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        Text(vault.amount, format: .currency(code: "USD"))
                            .font(.system(.body, weight: .black, design: .monospaced))
                            .foregroundColor(MilliColors.electricCyan)
                    }
                    .padding()
                    .background(MilliColors.carbon.opacity(0.5))
                    .cornerRadius(16)
                }
            }
            .padding(24)
            .padding(.bottom, 100)
        }
        .background(MilliColors.obsidian.ignoresSafeArea())
        .onAppear {
            withAnimation(.easeInOut(duration: 2.0).repeatForever(autoreverses: true)) {
                isAnimating = true
            }
        }
    }
}