import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    @StateObject private var aiViewModel = MilliAIViewModel()
    @EnvironmentObject var securityManager: SecurityManager
    
    var body: some View {
        ZStack {
            if securityManager.isLocked {
                LockView()
            } else {
                ZStack(alignment: .bottom) {
                    TabView(selection: $selectedTab) {
                        HomeDashboardView()
                            .tag(0)
                        PayoutsView()
                            .tag(1)
                        Color.clear.tag(2)
                        WealthView()
                            .tag(3)
                        MilliSettingsView()
                            .tag(4)
                    }
                    
                    MilliNavBar(selectedTab: $selectedTab) {
                        aiViewModel.triggerEventInsight(event: "manual_check")
                    }
                }
                .ignoresSafeArea(.keyboard)
                
                if aiViewModel.showMilliOverlay {
                    MilliAIOverlayView(viewModel: aiViewModel)
                }
            }
        }
    }
}