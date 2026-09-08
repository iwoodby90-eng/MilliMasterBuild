import SwiftUI

struct MilliAIOverlayView: View {
    @ObservedObject var viewModel: MilliAIViewModel
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.85).ignoresSafeArea()
                .onTapGesture { viewModel.dismiss() }
            
            VStack(spacing: 24) {
                Image(systemName: viewModel.mood == "excited" ? "sparkles" : "eye.fill")
                    .font(.system(size: 50))
                    .foregroundColor(MilliColors.electricCyan)
                    .frame(width: 100, height: 100)
                    .background(Circle().fill(MilliColors.carbon))
                    .overlay(Circle().stroke(MilliColors.electricCyan.opacity(0.2), lineWidth: 2))
                
                VStack(spacing: 8) {
                    Text("MILLI REPORT")
                        .font(.system(size: 12, weight: .bold, design: .monospaced))
                        .foregroundColor(.gray)
                    
                    Text(viewModel.insight)
                        .font(.system(size: 18, weight: .medium, design: .rounded))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                }
                
                Button(action: { viewModel.dismiss() }) {
                    Text("Continue")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(MilliColors.electricCyan)
                        .foregroundColor(MilliColors.obsidian)
                        .cornerRadius(16)
                }
            }
            .padding(30)
            .background(RoundedRectangle(cornerRadius: 32).fill(MilliColors.obsidian))
            .overlay(RoundedRectangle(cornerRadius: 32).stroke(MilliColors.electricCyan.opacity(0.2), lineWidth: 1))
            .padding(40)
            .transition(.scale.combined(with: .opacity))
        }
    }
}