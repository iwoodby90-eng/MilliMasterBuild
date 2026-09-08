import SwiftUI

struct MilliAIOverlayView: View {
    @ObservedObject var viewModel: MilliAIViewModel
    @State private var rotation: Double = 0
    @State private var isAnimating = false
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.9).ignoresSafeArea()
                .onTapGesture { viewModel.dismiss() }
            
            VStack(spacing: 40) {
                ZStack {
                    Circle()
                        .stroke(MilliColors.electricCyan.opacity(0.2), lineWidth: 1)
                        .frame(width: 140, height: 140)
                    
                    Circle()
                        .trim(from: 0, to: 0.75)
                        .stroke(MilliColors.electricCyan, style: StrokeStyle(lineWidth: 3, lineCap: .round))
                        .frame(width: 120, height: 120)
                        .rotationEffect(.degrees(rotation))
                    
                    Circle()
                        .fill(RadialGradient(colors: [MilliColors.electricCyan.opacity(0.3), .clear], center: .center, startRadius: 0, endRadius: 50))
                        .frame(width: 100, height: 100)
                    
                    Image(systemName: "sparkles")
                        .font(.system(size: 44))
                        .foregroundColor(.white)
                        .scaleEffect(isAnimating ? 1.1 : 0.9)
                }
                
                Text(viewModel.insight)
                    .font(.system(.body, design: .monospaced))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .padding(.horizontal)
                
                Button(action: { viewModel.dismiss() }) {
                    Text("DISMISS")
                        .font(.system(size: 10, weight: .black, design: .monospaced))
                        .padding(.horizontal, 32)
                        .padding(.vertical, 14)
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
        .onAppear {
            withAnimation(.linear(duration: 2).repeatForever(autoreverses: false)) {
                rotation = 360
            }
            withAnimation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true)) {
                isAnimating = true
            }
        }
        .transition(.asymmetric(insertion: .scale(scale: 0.95).combined(with: .opacity), removal: .opacity))
    }
}