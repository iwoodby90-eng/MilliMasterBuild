import SwiftUI

struct MilliCenterMButton: View {
    var action: () -> Void
    
    var body: some View {
        ZStack {
            // Outer Polished Silver Edge
            Circle()
                .stroke(LinearGradient(colors: [.white.opacity(0.5), .gray], startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2)
                .frame(width: 72, height: 72)
            
            // Black Recessed Tray
            Circle()
                .fill(Color.black)
                .frame(width: 68, height: 68)
            
            // Segmented Cyan Center Ring
            Circle()
                .trim(from: 0.1, to: 0.9)
                .stroke(MilliColors.electricCyan, style: StrokeStyle(lineWidth: 3, lineCap: .round))
                .frame(width: 60, height: 60)
                .rotationEffect(.degrees(45))
            
            // Raised Center M Housing
            Circle()
                .fill(LinearGradient(colors: [MilliColors.electricCyan, .blue], startPoint: .top, endPoint: .bottom))
                .frame(width: 50, height: 50)
                .shadow(color: MilliColors.electricCyan.opacity(0.5), radius: 10)
            
            Text("M")
                .font(MilliFont.sora(size: 24, weight: .black))
                .foregroundColor(.white)
            
            // Invisible label for accessibility/canonical requirement
            Text("HOME")
                .font(MilliFont.inter(size: 9, weight: .bold))
                .foregroundColor(.gray)
                .offset(y: 40)
        }
        .onTapGesture {
            UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
            action()
        }
    }
}