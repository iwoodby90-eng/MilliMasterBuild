import SwiftUI

struct MilliCenterMButton: View {
    var action: () -> Void
    @State private var isPressed = false

    var body: some View {
        Button(action: {
            UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
            action()
        }) {
            ZStack {
                // Chrome Bezel
                Circle()
                    .stroke(MilliColors.polishedSilver, lineWidth: 2)
                    .frame(width: 64, height: 64)
                
                // Black Glass Center
                Circle()
                    .fill(MilliColors.obsidian)
                    .frame(width: 56, height: 56)
                    .overlay(
                        Text("M")
                            .font(.system(size: 24, weight: .black, design: .rounded))
                            .foregroundColor(isPressed ? MilliColors.electricCyan : .white)
                    )
            }
            .scaleEffect(isPressed ? 0.95 : 1.0)
        }
        .buttonStyle(PlainButtonStyle())
        .pressEvents(onPress: { isPressed = true }, onRelease: { isPressed = false })
    }
}

// Helper for press state
struct PressActions: ViewModifier {
    var onPress: () -> Void
    var onRelease: () -> Void
    func body(content: Content) -> some View {
        content.simultaneousGesture(DragGesture(minimumDistance: 0)
            .onChanged { _ in onPress() }
            .onEnded { _ in onRelease() })
    }
}

extension View {
    func pressEvents(onPress: @escaping () -> Void, onRelease: @escaping () -> Void) -> some View {
        modifier(PressActions(onPress: onPress, onRelease: onRelease))
    }
}