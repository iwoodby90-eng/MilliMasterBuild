import SwiftUI

struct MilliNavBar: View {
    @Binding var selectedTab: Int
    
    var body: some View {
        HStack {
            navItem(index: 0, icon: "list.bullet.rectangle", label: "Payouts")
            navItem(index: 1, icon: "location.fill", label: "Mileage")
            
            Spacer()
            MilliCenterMButton { selectedTab = 2 }
            Spacer()
            
            navItem(index: 3, icon: "chart.pie.fill", label: "Wealth")
            navItem(index: 4, icon: "ellipsis", label: "More")
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
        .background(MilliColors.carbon.ignoresSafeArea())
    }
    
    private func navItem(index: Int, icon: String, label: String) -> some View {
        Button(action: { selectedTab = index }) {
            VStack(spacing: 4) {
                Image(systemName: icon)
                    .font(.system(size: 20))
                Text(label)
                    .font(.system(size: 10, weight: .medium))
            }
            .foregroundColor(selectedTab == index ? MilliColors.electricCyan : .gray)
        }
        .frame(width: 60)
    }
}