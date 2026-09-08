import SwiftUI

struct MilliCenterMButton: View {
    var action: () -> Void
    @State private var isPressed = false
    @State private var pulse = false

    var body: some View {
        Button(action: {
            UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
            withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                action()
            }
        }) {
            ZStack {
                // Outer Glow/Ring
                Circle()
                    .stroke(LinearGradient(colors: [MilliColors.electricCyan, .clear], startPoint: .top, endPoint: .bottom), lineWidth: 2)
                    .frame(width: 80, height: 80)
                    .scaleEffect(pulse ? 1.1 : 1.0)
                    .opacity(pulse ? 0.5 : 0.2)
                
                // Metallic Base
                Circle()
                    .fill(LinearGradient(colors: [MilliColors.polishedSilver, .gray], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(width: 72, height: 72)
                    .shadow(color: .black.opacity(0.6), radius: 6, x: 0, y: 4)
                
                // Inner Screen
                Circle()
                    .fill(RadialGradient(colors: [MilliColors.carbon, MilliColors.obsidian], center: .center, startRadius: 5, endRadius: 35))
                    .frame(width: 64, height: 64)
                    .overlay(
                        Circle().stroke(MilliColors.electricCyan.opacity(isPressed ? 0.8 : 0.4), lineWidth: 2)
                    )
                    .overlay(
                        Image(systemName: "eye.fill") // Inspector Gadget "Eye" motif
                            .font(.system(size: 28))
                            .foregroundColor(isPressed ? .white : MilliColors.electricCyan)
                            .shadow(color: MilliColors.electricCyan.opacity(0.8), radius: 8)
                    )
            }
            .scaleEffect(isPressed ? 0.90 : 1.0)
        }
        .buttonStyle(PlainButtonStyle())
        .pressEvents(onPress: { isPressed = true }, onRelease: { isPressed = false })
        .onAppear {
            withAnimation(.easeInOut(duration: 2.0).repeatForever(autoreverses: true)) {
                pulse = true
            }
        }
    }
}