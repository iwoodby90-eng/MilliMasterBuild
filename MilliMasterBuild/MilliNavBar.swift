import SwiftUI

struct MilliNavBar: View {
    @Binding var selectedTab: Int
    var onMilliTap: () -> Void
    
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            navItem(index: 0, icon: "list.bullet.rectangle.portrait", label: "Payouts")
            navItem(index: 1, icon: "location.north.line", label: "Mileage")
            
            Spacer()
            
            MilliCenterMButton { 
                onMilliTap()
            }
            .offset(y: -25)
            
            Spacer()
            
            navItem(index: 3, icon: "chart.line.uptrend.xyaxis", label: "Wealth")
            navItem(index: 4, icon: "line.3.horizontal", label: "More")
        }
        .padding(.horizontal, 24)
        .padding(.top, 10)
        .padding(.bottom, 34)
        .background(
            Rectangle()
                .fill(MilliColors.obsidian.opacity(0.9))
                .background(.ultraThinMaterial)
                .overlay(Rectangle().frame(height: 0.5).foregroundColor(MilliColors.electricCyan.opacity(0.2)), alignment: .top)
        )
    }
    
    private func navItem(index: Int, icon: String, label: String) -> some View {
        Button(action: { withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) { selectedTab = index } }) {
            VStack(spacing: 6) {
                Image(systemName: icon)
                    .font(.system(size: 22, weight: .medium))
                Text(label)
                    .font(.system(size: 9, weight: .bold, design: .monospaced))
            }
            .foregroundColor(selectedTab == index ? MilliColors.electricCyan : .gray.opacity(0.6))
            .frame(width: 65)
        }
    }
}