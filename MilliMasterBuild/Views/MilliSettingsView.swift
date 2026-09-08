import SwiftUI

struct MilliSettingsView: View {
    @EnvironmentObject var securityManager: SecurityManager
    
    var body: some View {
        NavigationStack {
            List {
                Section("Account") {
                    SettingsRow(icon: "person.fill", title: "Profile", color: .white)
                    SettingsRow(icon: "shield.fill", title: "Security", color: MilliColors.electricCyan)
                }
                
                Section("Data") {
                    SettingsRow(icon: "arrow.triangle.2.circlepath", title: "Sync Plaid Data", color: .green)
                    SettingsRow(icon: "trash.fill", title: "Clear Cache", color: .red)
                }
                
                Section {
                    Button("Lock App") {
                        securityManager.lock()
                    }
                    .foregroundColor(.red)
                }
            }
            .scrollContentBackground(.hidden)
            .background(MilliColors.obsidian)
            .navigationTitle("Settings")
            .toolbarColorScheme(.dark, for: .navigationBar)
        }
    }
}

struct SettingsRow: View {
    let icon: String
    let title: String
    let color: Color
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: icon)
                .foregroundColor(color)
                .frame(width: 30)
            Text(title)
                .font(.body.medium())
        }
        .listRowBackground(MilliColors.carbon)
    }
}