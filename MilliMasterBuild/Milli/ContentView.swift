import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 2 // Center M is Home
    
    var body: some View {
        ZStack(alignment: .bottom) {
            MilliColors.obsidian.ignoresSafeArea()
            
            // Main Content Area
            TabView(selection: $selectedTab) {
                Text("Payouts").tag(0)
                Text("Mileage").tag(1)
                HomeDashboardView().tag(2)
                Text("Wealth").tag(3)
                Text("More").tag(4)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            
            MilliNavBar(selectedTab: $selectedTab)
        }
    }
}