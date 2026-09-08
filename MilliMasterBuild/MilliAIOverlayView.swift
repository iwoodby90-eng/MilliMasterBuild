import SwiftUI

struct MilliAIOverlayView: View {
    @ObservedObject var viewModel: MilliAIViewModel
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.7).ignoresSafeArea()
                .onTapGesture { viewModel.dismiss() }
            
            VStack(spacing: 20) {
                // Inspector Gadget "Hat" or "Eye" icon
                Image(systemName: viewModel.mood == "excited" ? "sparkles" : "eye.fill")
                    .font(.system(size: 60))
                    .foregroundColor(MilliColors.electricCyan)
                    .padding()
                    .background(Circle().fill(MilliColors.carbon))
                
                Text("MILLI REPORT")
                    .font(.system(size: 14, weight: .bold, design: .monospaced))
                    .foregroundColor(.gray)
                
                Text(viewModel.insight)
                    .font(.system(size: 18, weight: .medium, design: .rounded))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .padding(.horizontal)
                
                Button("Dismiss") {
                    viewModel.dismiss()
                }
                .buttonStyle(.borderedProminent)
                .tint(MilliColors.electricCyan)
            }
            .padding(30)
            .background(RoundedRectangle(cornerRadius: 24).fill(MilliColors.obsidian))
            .overlay(RoundedRectangle(cornerRadius: 24).stroke(MilliColors.electricCyan.opacity(0.3), lineWidth: 1))
            .padding(40)
        }
    }
}