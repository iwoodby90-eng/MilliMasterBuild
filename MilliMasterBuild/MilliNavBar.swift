import SwiftUI

struct MilliNavBar: View {
    @Binding var selectedTab: Int
    
    var body: some View {
        HStack {
            navButton(index: 0, icon: "house.fill")
            navButton(index: 1, icon: "car.fill")
            
            MilliCenterMButton {
                // Action handled by NotificationCenter
            }
            .offset(y: -20)
            
            navButton(index: 3, icon: "chart.pie.fill")
            navButton(index: 4, icon: "gearshape.fill")
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 12)
        .background(MilliColors.obsidian.ignoresSafeArea())
        .overlay(Divider().background(MilliColors.electricCyan.opacity(0.2)), alignment: .top)
    }
    
    private func navButton(index: Int, icon: String) -> some View {
        Button(action: { selectedTab = index }) {
            Image(systemName: icon)
                .font(.system(size: 20))
                .foregroundColor(selectedTab == index ? MilliColors.electricCyan : .gray)
                .frame(maxWidth: .infinity)
        }
    }
}