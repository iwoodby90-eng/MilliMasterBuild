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
            .offset(y: -20)
            
            Spacer()
            
            navItem(index: 3, icon: "chart.line.uptrend.xyaxis", label: "Wealth")
            navItem(index: 4, icon: "line.3.horizontal", label: "More")
        }
        .padding(.horizontal, 24)
        .padding(.bottom, 34)
        .background(MilliColors.obsidian.opacity(0.8).background(.ultraThinMaterial))
    }
    
    private func navItem(index: Int, icon: String, label: String) -> some View {
        Button(action: { withAnimation { selectedTab = index } }) {
            VStack(spacing: 4) {
                Image(systemName: icon).font(.system(size: 20, weight: .medium))
                Text(label).font(.system(size: 9, weight: .bold, design: .rounded))
            }
            .foregroundColor(selectedTab == index ? MilliColors.electricCyan : .gray.opacity(0.5))
            .frame(width: 60)
        }
    }
}