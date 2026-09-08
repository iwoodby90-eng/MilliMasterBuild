import SwiftUI

struct WealthView: View {
    var body: some View {
        ZStack {
            MilliColors.obsidian.ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("WEALTH ANALYTICS")
                    .font(.system(size: 10, weight: .black, design: .monospaced))
                    .tracking(6)
                    .foregroundColor(MilliColors.electricCyan)
                    .padding(.top, 20)
                
                Spacer()
                
                Image(systemName: "chart.line.uptrend.xyaxis")
                    .font(.system(size: 64))
                    .foregroundColor(MilliColors.electricCyan.opacity(0.5))
                
                Text("PROJECTION ACTIVE")
                    .font(.system(size: 14, weight: .bold, design: .monospaced))
                    .foregroundColor(.white.opacity(0.6))
                
                Spacer()
            }
        }
    }
}