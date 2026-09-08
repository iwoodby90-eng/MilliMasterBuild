import SwiftUI

struct MilliNavBar: View {
    @Binding var selectedTab: Int
    
    var body: some View {
        ZStack(alignment: .top) {
            // Machined Metallic Top Rail
            Rectangle()
                .fill(LinearGradient(colors: [.gray.opacity(0.3), .black], startPoint: .top, endPoint: .bottom))
                .frame(height: 1)
            
            HStack(spacing: 0) {
                navItem(index: 0, icon: "wallet.fill", label: "Payouts")
                navItem(index: 1, icon: "arrow.triangle.turn.up.right.diamond", label: "Mileage")
                
                Spacer()
                
                MilliCenterMButton(action: { selectedTab = 2 })
                    .offset(y: -25)
                
                Spacer()
                
                navItem(index: 3, icon: "bag.badge.plus", label: "Wealth")
                navItem(index: 4, icon: "ellipsis", label: "More")
            }
            .padding(.horizontal, 12)
            .padding(.top, 10)
            .background(Color.black.ignoresSafeArea())
        }
    }
    
    private func navItem(index: Int, icon: String, label: String) -> some View {
        Button(action: { selectedTab = index }) {
            VStack(spacing: 4) {
                Image(systemName: icon)
                    .font(.system(size: 20))
                Text(label.uppercased())
                    .font(MilliFont.inter(size: 9, weight: .bold))
            }
            .foregroundColor(selectedTab == index ? MilliColors.electricCyan : .gray)
            .frame(width: 60)
        }
    }
}