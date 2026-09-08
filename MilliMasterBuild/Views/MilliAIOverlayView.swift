import SwiftUI

struct MilliAIOverlayView: View {
    @ObservedObject var viewModel: MilliAIViewModel
    @State private var rotation: Double = 0
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.9).ignoresSafeArea()
                .onTapGesture { viewModel.dismiss() }
            
            VStack(spacing: 40) {
                // The "Eye" Motif - Enhanced
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
                    
                    Image(systemName: "eye.fill")
                        .font(.system(size: 44))
                        .foregroundColor(.white)
                        .shadow(color: MilliColors.electricCyan, radius: 15)
                }
                .onAppear {
                    withAnimation(.linear(duration: 3).repeatForever(autoreverses: false)) {
                        rotation = 360
                    }
                }
                
                VStack(spacing: 16) {
                    Text("MILLI INTELLIGENCE")
                        .font(.system(size: 11, weight: .black, design: .monospaced))
                        .tracking(6)
                        .foregroundColor(MilliColors.electricCyan)
                    
                    Text(viewModel.insight)
                        .font(.system(.body, design: .rounded))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white.opacity(0.9))
                        .padding(.horizontal, 30)
                        .fixedSize(horizontal: false, vertical: true)
                }
                
                Button(action: { viewModel.dismiss() }) {
                    Text("ACKNOWLEDGE")
                        .font(.system(size: 12, weight: .bold, design: .monospaced))
                        .tracking(2)
                        .padding(.vertical, 14)
                        .padding(.horizontal, 40)
                        .background(Capsule().stroke(MilliColors.electricCyan, lineWidth: 1))
                        .foregroundColor(MilliColors.electricCyan)
                }
            }
            .padding(40)
            .background(
                RoundedRectangle(cornerRadius: 40)
                    .fill(MilliColors.obsidian)
                    .overlay(RoundedRectangle(cornerRadius: 40).stroke(MilliColors.electricCyan.opacity(0.15), lineWidth: 1))
            )
            .padding(20)
            .transition(.asymmetric(insertion: .scale(scale: 0.9).combined(with: .opacity), removal: .opacity))
        }
    }
}