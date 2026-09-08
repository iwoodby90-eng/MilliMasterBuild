import SwiftUI

struct LockScreenView: View {
    @ObservedObject var securityManager: SecurityManager
    
    var body: some View {
        VStack(spacing: 30) {
            Image(systemName: "lock.shield.fill")
                .font(.system(size: 80))
                .foregroundColor(MilliColors.electricCyan)
            
            Text("MILLI SECURE")
                .font(.system(size: 24, weight: .bold, design: .monospaced))
                .foregroundColor(.white)
            
            Button(action: { securityManager.authenticate() }) {
                Text("Unlock Access")
                    .font(.headline)
                    .padding()
                    .frame(width: 200)
                    .background(MilliColors.electricCyan)
                    .foregroundColor(MilliColors.obsidian)
                    .cornerRadius(12)
            }
            
            if let error = securityManager.authError {
                Text(error)
                    .font(.caption)
                    .foregroundColor(.red)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MilliColors.obsidian.ignoresSafeArea())
    }
}