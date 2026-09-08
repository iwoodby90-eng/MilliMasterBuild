import SwiftUI

// Standardized Design Tokens
struct MilliTokens {
    static let radius: CGFloat = 16
    static let spacing: CGFloat = 24
    static let chromeGradient = LinearGradient(
        colors: [.white.opacity(0.3), .gray.opacity(0.5), .black],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}

struct MilliSectionHeader: View {
    let title: String
    
    var body: some View {
        Text(title.uppercased())
            .font(MilliFont.inter(size: 10, weight: .bold))
            .foregroundColor(.gray)
            .tracking(2)
    }
}

struct MilliStatusBadge: View {
    let status: String
    
    var body: some View {
        Text(status.uppercased())
            .font(MilliFont.inter(size: 9, weight: .bold))
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(MilliColors.electricCyan.opacity(0.1))
            .foregroundColor(MilliColors.electricCyan)
            .cornerRadius(4)
    }
}