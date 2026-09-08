import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 2
    @StateObject private var aiViewModel = MilliAIViewModel()
    @EnvironmentObject var securityManager: SecurityManager
    
    var body: some View {
        ZStack {
            if securityManager.isAuthenticated {
                VStack(spacing: 0) {
                    TabView(selection: $selectedTab) {
                        PayoutsView().tag(0)
                        MileageView().tag(1)
                        HomeDashboardView().tag(2)
                        WealthView().tag(3)
                        MilliSettingsView().tag(4)
                    }
                    
                    MilliNavBar(selectedTab: $selectedTab) {
                        aiViewModel.triggerEventInsight(event: "manual_check")
                    }
                }
                .overlay(
                    Group {
                        if aiViewModel.showMilliOverlay {
                            MilliAIOverlayView(viewModel: aiViewModel)
                        }
                    }
                )
            } else {
                LockScreenView(securityManager: securityManager)
            }
        }
        .onAppear { 
            if !securityManager.isAuthenticated {
                securityManager.authenticate() 
            }
        }
    }
}