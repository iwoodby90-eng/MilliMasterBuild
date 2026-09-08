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
                .font(.title2.bold())
            
            Text("Securely link your accounts to track payouts and tax savings automatically.")
                .multilineTextAlignment(.center)
                .foregroundColor(.gray)
                .padding(.horizontal)
            
            Button(action: { /* Trigger Plaid Link */ }) {
                Text("Link Account")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(MilliColors.electricCyan)
                    .foregroundColor(MilliColors.obsidian)
                    .cornerRadius(16)
            }
            .padding(.horizontal)
        }
        .padding()
    }
}