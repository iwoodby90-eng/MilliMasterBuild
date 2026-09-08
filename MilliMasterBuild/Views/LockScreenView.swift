import SwiftUI

struct LockScreenView: View {
    @ObservedObject var securityManager: SecurityManager
    
    var body: some View {
        ZStack {
            MilliColors.obsidian.ignoresSafeArea()
            
            VStack(spacing: 40) {
                Spacer()
                
                ZStack {
                    Circle()
                        .fill(MilliColors.electricCyan.opacity(0.1))
                        .frame(width: 150, height: 150)
                    Image(systemName: "lock.shield.fill")
                        .font(.system(size: 60))
                        .foregroundColor(MilliColors.electricCyan)
                }
                
                VStack(spacing: 8) {
                    Text("MILLI SECURE")
                        .font(.system(size: 28, weight: .black, design: .monospaced))
                        .foregroundColor(.white)
                    Text("Authenticate to access your financial data")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                Button(action: { securityManager.authenticate() }) {
                    HStack {
                        Image(systemName: "faceid")
                        Text("Unlock Access")
                    }
                    .font(.headline)
                    .padding()
                    .frame(width: 220)
                    .background(MilliColors.electricCyan)
                    .foregroundColor(MilliColors.obsidian)
                    .cornerRadius(16)
                }
                .buttonStyle(.plain)
                
                if let error = securityManager.authError {
                    Text(error)
                        .font(.caption)
                        .foregroundColor(.red.opacity(0.8))
                }
                
                Spacer()
            }
            .padding()
        }
    }
}