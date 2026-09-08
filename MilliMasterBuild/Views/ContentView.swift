import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Int = 0
    @State private var showAI = false
    @StateObject private var aiViewModel = MilliAIViewModel()
    @EnvironmentObject var securityManager: SecurityManager
    
    var body: some View {
        ZStack {
            if securityManager.isUnlocked {
                ZStack(alignment: .bottom) {
                    TabView(selection: $selectedTab) {
                        HomeDashboardView().tag(0)
                        MileageView().tag(1)
                        Color.clear.tag(2)
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
                VStack(spacing: 20) {
                    Image(systemName: "lock.shield.fill").font(.system(size: 60)).foregroundColor(MilliColors.electricCyan)
                    Text("MILLI SECURE").font(.system(size: 20, weight: .black, design: .monospaced))
                    Button("Unlock Access") { securityManager.authenticate() }
                        .padding().background(MilliColors.carbon).cornerRadius(12)
                }
                .onAppear { securityManager.authenticate() }
            }
        }
        .ignoresSafeArea(.keyboard)
        .background(MilliColors.obsidian)
        .onReceive(NotificationCenter.default.publisher(for: NSNotification.Name("TriggerAI"))) { _ in
            Task {
                await aiViewModel.generateInsight()
                withAnimation(.spring(response: 0.4, dampingFraction: 0.7)) { showAI = true }
            }
        }
    }
}