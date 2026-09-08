import SwiftUI

struct MilliAIOverlay: View {
    @ObservedObject var viewModel: MilliAIViewModel
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.85).ignoresSafeArea()
                .onTapGesture { viewModel.dismiss() }
            
            VStack(spacing: 24) {
                Circle()
                    .fill(MilliColors.electricCyan.opacity(0.1))
                    .frame(width: 80, height: 80)
                    .overlay(Image(systemName: "sparkles").font(.system(size: 32)).foregroundColor(MilliColors.electricCyan))
                
                Text(viewModel.insight)
                    .font(.system(.body, design: .monospaced))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .padding(.horizontal)
                
                Button(action: { viewModel.dismiss() }) {
                    Text("DISMISS")
                        .font(.system(size: 10, weight: .black, design: .monospaced))
                        .padding(.horizontal, 24)
                        .padding(.vertical, 12)
                        .background(MilliColors.electricCyan.opacity(0.1))
                        .foregroundColor(MilliColors.electricCyan)
                        .cornerRadius(8)
                }
            }
            .padding(32)
            .background(MilliColors.carbon)
            .cornerRadius(24)
            .overlay(RoundedRectangle(cornerRadius: 24).stroke(MilliColors.electricCyan.opacity(0.2), lineWidth: 1))
            .padding(40)
        }
        .transition(.asymmetric(insertion: .scale(scale: 0.95).combined(with: .opacity), removal: .opacity))
    }
}