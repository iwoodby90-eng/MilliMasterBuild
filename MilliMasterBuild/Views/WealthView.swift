import SwiftUI
import SwiftData

struct WealthView: View {
    @Query private var vaults: [TaxVault]
    
    var body: some View {
        ZStack {
            MilliColors.obsidian.ignoresSafeArea()
            VStack(spacing: 20) {
                Text("WEALTH PORTFOLIO")
                    .font(.system(size: 12, weight: .bold, design: .monospaced))
                    .foregroundColor(MilliColors.electricCyan)
                    .padding(.top, 60)
                
                if let vault = vaults.first {
                    VStack {
                        Text("TAX VAULT BALANCE")
                            .font(.caption.bold())
                            .foregroundColor(.gray)
                        Text("$\(vault.balance, specifier: "%.2f")")
                            .font(.system(size: 48, weight: .black, design: .rounded))
                            .foregroundColor(.white)
                    }
                    .padding(40)
                    .background(RoundedRectangle(cornerRadius: 24).fill(MilliColors.carbon))
                } else {
                    Text("No active tax vault found.")
                        .foregroundColor(.gray)
                }
                
                Spacer()
            }
        }
    }
}