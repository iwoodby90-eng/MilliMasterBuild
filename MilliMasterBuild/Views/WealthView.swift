import SwiftUI
import SwiftData

struct WealthView: View {
    @Query private var vaults: [TaxVault]
    
    var body: some View {
        ZStack {
            MilliColors.obsidian.ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 24) {
                    header
                    
                    if let vault = vaults.first {
                        balanceCard(vault: vault)
                        performanceChart
                    } else {
                        emptyState
                    }
                }
                .padding(.top, 20)
            }
        }
    }
    
    private var header: some View {
        VStack(spacing: 4) {
            Text("WEALTH PORTFOLIO")
                .font(.system(size: 10, weight: .bold, design: .monospaced))
                .tracking(3)
                .foregroundColor(MilliColors.electricCyan)
            Text("Tax & Savings Overview")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding(.top, 40)
    }
    
    private func balanceCard(vault: TaxVault) -> some View {
        VStack(spacing: 12) {
            Text("TOTAL TAX VAULT")
                .font(.caption.bold())
                .foregroundColor(.gray)
            Text(vault.balance, format: .currency(code: "USD"))
                .font(.system(size: 48, weight: .black, design: .rounded))
                .foregroundColor(.white)
                .shadow(color: MilliColors.electricCyan.opacity(0.3), radius: 10)
        }
        .frame(maxWidth: .infinity)
        .padding(40)
        .background(
            RoundedRectangle(cornerRadius: 32)
                .fill(MilliColors.carbon)
                .overlay(RoundedRectangle(cornerRadius: 32).stroke(MilliColors.electricCyan.opacity(0.1), lineWidth: 1))
        )
        .padding(.horizontal)
    }
    
    private var performanceChart: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("GROWTH TREND")
                .font(.caption.bold())
                .foregroundColor(.gray)
            
            HStack(alignment: .bottom, spacing: 8) {
                ForEach(0..<12) { _ in
                    RoundedRectangle(cornerRadius: 4)
                        .fill(MilliColors.electricCyan.opacity(0.6))
                        .frame(width: 12, height: CGFloat.random(in: 40...120))
                }
            }
            .frame(height: 120)
        }
        .padding(24)
        .background(RoundedRectangle(cornerRadius: 24).fill(MilliColors.carbon.opacity(0.3)))
        .padding(.horizontal)
    }
    
    private var emptyState: some View {
        VStack(spacing: 16) {
            Image(systemName: "vault")
                .font(.system(size: 40))
                .foregroundColor(.gray.opacity(0.5))
            Text("No active tax vault found.")
                .foregroundColor(.gray)
        }
        .padding(.top, 100)
    }
}