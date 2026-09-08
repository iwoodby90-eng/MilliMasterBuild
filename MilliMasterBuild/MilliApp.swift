import SwiftUI
import SwiftData

@main
struct MilliApp: App {
    @Environment(\.scenePhase) private var scenePhase
    @StateObject private var securityManager = SecurityManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(.dark)
                .environmentObject(securityManager)
        }
        .modelContainer(for: [Payout.self, MileageEntry.self, TaxVault.self])
        .onChange(of: scenePhase) { _, newPhase in
            if newPhase == .background || newPhase == .inactive {
                securityManager.lock()
            }
        }
    }
}