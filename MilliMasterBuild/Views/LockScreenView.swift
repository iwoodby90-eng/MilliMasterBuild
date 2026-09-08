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
                
                Button(action: { 
                    UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                    securityManager.authenticate() 
                }) {
                    HStack {
                        Image(systemName: "faceid")
                        Text("Unlock Access")
                    }
                    .font(.system(size: 14, weight: .bold, design: .monospaced))
                    .padding(.horizontal, 32)
                    .padding(.vertical, 16)
                    .background(MilliColors.electricCyan.opacity(0.1))
                    .foregroundColor(MilliColors.electricCyan)
                    .cornerRadius(12)
                    .overlay(RoundedRectangle(cornerRadius: 12).stroke(MilliColors.electricCyan.opacity(0.3), lineWidth: 1))
                }
                
                Spacer()
            }
            .padding(40)
        }
    }
}