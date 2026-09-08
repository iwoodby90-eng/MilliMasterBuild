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
                withAnimation(.spring()) { isPressed = false }
                action()
                NotificationCenter.default.post(name: NSNotification.Name("TriggerAI"), object: nil)
            }
        }) {
            ZStack {
                Circle()
                    .fill(MilliColors.obsidian)
                    .frame(width: 64, height: 64)
                    .overlay(Circle().stroke(MilliColors.electricCyan, lineWidth: 2))
                
                Image(systemName: "sparkles")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(MilliColors.electricCyan)
            }
            .scaleEffect(isPressed ? 0.85 : 1.0)
            .shadow(color: MilliColors.electricCyan.opacity(0.4), radius: 15, x: 0, y: 5)
        }
        .buttonStyle(PlainButtonStyle())
    }
}