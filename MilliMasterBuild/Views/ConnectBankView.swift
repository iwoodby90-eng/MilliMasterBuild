import SwiftUI
import LinkKit

struct ConnectBankView: View {
    @ObservedObject var plaidManager: PlaidManager
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "building.columns.fill")
                .font(.system(size: 60))
                .foregroundColor(MilliColors.electricCyan)
            
            Text("Connect Your Bank")
                .font(.system(size: 24, weight: .black, design: .monospaced))
                .foregroundColor(.white)
            
            Text("Securely link your accounts to track payouts and tax savings automatically.")
                .font(.system(.body, design: .monospaced))
                .multilineTextAlignment(.center)
                .foregroundColor(.gray)
                .padding(.horizontal)
            
            Button(action: { plaidManager.presentPlaidLink() }) {
                Text("LINK ACCOUNT")
                    .font(.system(size: 12, weight: .black, design: .monospaced))
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(MilliColors.electricCyan)
                    .foregroundColor(MilliColors.obsidian)
                    .cornerRadius(16)
            }
            .padding(.horizontal)
        }
        .padding()
        .background(MilliColors.obsidian.ignoresSafeArea())
    }
}