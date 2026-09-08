import SwiftUI
import SwiftData

struct TaxVaultView: View {
    @Query(sort: \TaxVault.date, order: .reverse) private var ledger: [TaxVault]
    
    // Configuration
    private let annualTarget: Double = 12000.0 
    
    var settledBalance: Double {
        ledger.filter { $0.status == "settled" }.reduce(0) { $0 + $1.amount }
    }
    
    var processingAmount: Double {
        ledger.filter { $0.status == "processing" }.reduce(0) { $0 + $1.amount }
    }
    
    var progress: Double {
        annualTarget > 0 ? min(settledBalance / annualTarget, 1.0) : 0
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Header
                VStack(alignment: .leading, spacing: 8) {
                    Text("MILLI TAX VAULT™").font(MilliFont.inter(size: 10, weight: .bold)).foregroundColor(.gray)
                    Text(settledBalance, format: .currency(code: "USD"))
                        .font(MilliFont.sora(size: 44, weight: .black))
                        .monospacedDigit()
                    
                    if processingAmount > 0 {
                        Text("+\(processingAmount.formatted(.currency(code: "USD"))) processing")
                            .font(MilliFont.inter(size: 12, weight: .medium))
                            .foregroundColor(MilliColors.electricCyan)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                // Progress
                VStack(alignment: .leading, spacing: 16) {
                    HStack {
                        Text("ANNUAL TARGET").font(MilliFont.inter(size: 10, weight: .bold)).foregroundColor(.gray)
                        Spacer()
                        Text("\(Int(progress * 100))%").font(MilliFont.inter(size: 10, weight: .bold)).foregroundColor(MilliColors.electricCyan)
                    }
                    ProgressView(value: progress)
                        .tint(MilliColors.electricCyan)
                }
                .padding(24)
                .background(MilliColors.carbon)
                .cornerRadius(MilliTokens.radius)
                
                // Ledger
                VStack(alignment: .leading, spacing: 16) {
                    Text("LEDGER").font(MilliFont.inter(size: 10, weight: .bold)).foregroundColor(.gray)
                    
                    if ledger.isEmpty {
                        Text("No vault activity").font(MilliFont.inter(size: 12)).foregroundColor(.gray)
                    } else {
                        ForEach(ledger) { entry in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(entry.name).font(MilliFont.inter(size: 14, weight: .medium))
                                    Text(entry.date, style: .date).font(MilliFont.inter(size: 10)).foregroundColor(.gray)
                                }
                                Spacer()
                                VStack(alignment: .trailing) {
                                    Text(entry.amount, format: .currency(code: "USD")).font(MilliFont.sora(size: 14, weight: .bold))
                                    MilliStatusBadge(status: entry.status)
                                }
                            }
                        }
                    }
                }
                .padding(24)
                .background(MilliColors.carbon)
                .cornerRadius(MilliTokens.radius)
            }
            .padding(24)
        }
        .background(MilliColors.obsidian.ignoresSafeArea())
    }
}