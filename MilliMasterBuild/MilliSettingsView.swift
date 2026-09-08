import SwiftUI

struct MilliSettingsView: View {
    @AppStorage("isDarkMode") private var isDarkMode = true
    
    var body: some View {
        List {
            Section(header: Text("ACCOUNT").font(.system(size: 10, weight: .bold, design: .monospaced))) {
                SettingsRow(title: "Profile", icon: "person.fill")
                SettingsRow(title: "Security", icon: "lock.shield.fill")
            }
            
            Section(header: Text("PREFERENCES").font(.system(size: 10, weight: .bold, design: .monospaced))) {
                Toggle("Dark Mode", isOn: $isDarkMode)
                    .tint(MilliColors.electricCyan)
            }
        }
        .scrollContentBackground(.hidden)
        .background(MilliColors.obsidian)
    }
}

struct SettingsRow: View {
    let title: String
    let icon: String
    
    var body: some View {
        HStack {
            Image(systemName: icon).foregroundColor(MilliColors.electricCyan)
            Text(title).font(.system(.body, design: .monospaced))
            Spacer()
            Image(systemName: "chevron.right").font(.caption).foregroundColor(.gray)
        }
        .padding(.vertical, 4)
    }
}