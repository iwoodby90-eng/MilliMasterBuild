import SwiftUI

struct MilliSettingsView: View {
    @EnvironmentObject var securityManager: SecurityManager
    
    var body: some View {
        List {
            Section(header: Text("Gadget Configuration").foregroundColor(MilliColors.electricCyan)) {
                Toggle("Enable Voice Feedback", isOn: .constant(true))
                Toggle("Auto-Log Mileage", isOn: .constant(true))
                NavigationLink("Security & Privacy", destination: SecuritySettingsView())
            }
            
            Section(header: Text("Account")) {
                Button("Sync Tree of Life Data") { }
                Button("Reset AI Personality", role: .destructive) { }
                Button("Lock App", role: .destructive) {
                    securityManager.lock()
                }
            }
        }
        .scrollContentBackground(.hidden)
        .background(MilliColors.obsidian)
        .navigationTitle("Settings")
    }
}

struct SecuritySettingsView: View {
    var body: some View {
        Form {
            Section("Authentication") {
                Text("Biometric Lock is currently active.")
            }
        }
        .navigationTitle("Security")
    }
}