import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Int = 2 // Default to Home (Center M)
    @State private var showAI = false
    @StateObject private var aiViewModel = MilliAIViewModel()
    @EnvironmentObject var securityManager: SecurityManager
    
    var body: some View {
        ZStack {
            if securityManager.isUnlocked {
                ZStack(alignment: .bottom) {
                    TabView(selection: $selectedTab) {
                        PayoutsView().tag(0)
                        MileageView().tag(1)
                        HomeDashboardView().tag(2)
                        WealthView().tag(3)
                        MilliSettingsView().tag(4)
                    }
                    .tabViewStyle(.page(indexDisplayMode: .never))
                    
                    MilliNavBar(selectedTab: $selectedTab)
                    
                    if showAI {
                        MilliAIOverlayView(viewModel: aiViewModel)
                            .zIndex(1)
                    }
                }
            } else {
                // ... (Lock screen logic remains unchanged)
            }
        }
        .ignoresSafeArea(.keyboard)
        .background(MilliColors.obsidian)
    }
}