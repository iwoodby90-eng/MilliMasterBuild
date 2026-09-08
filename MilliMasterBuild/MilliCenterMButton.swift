import SwiftUI

struct MilliCenterMButton: View {
    var action: () -> Void
    @State private var isPressed = false

    var body: some View {
        Button(action: {
            UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
            withAnimation(.spring(response: 0.3, dampingFraction: 0.5)) {
                isPressed = true
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                isPressed = false
                action()
            }
        }) {
            ZStack {
                Circle()
                    .fill(MilliColors.obsidian)
                    .frame(width: 64, height: 64)
                    .overlay(Circle().stroke(MilliColors.electricCyan, lineWidth: 2))
                
                Text("M")
                    .font(.system(size: 24, weight: .black, design: .monospaced))
                    .foregroundColor(MilliColors.electricCyan)
            }
            .scaleEffect(isPressed ? 0.9 : 1.0)
            .shadow(color: MilliColors.electricCyan.opacity(0.3), radius: 10, x: 0, y: 0)
        }
    }
}