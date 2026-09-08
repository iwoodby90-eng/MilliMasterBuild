import SwiftUI

struct MilliSettingsView: View {
    var body: some View {
        NavigationStack {
            List {
                Section {
                    SettingsRow(title: "Account Security", icon: "lock.shield.fill")
                    SettingsRow(title: "Connected Banks", icon: "building.columns.fill")
                } header: { 
                    Text("SECURITY").font(.system(size: 10, weight: .black, design: .monospaced)).foregroundColor(.gray) 
                }
                
                Section {
                    SettingsRow(title: "Data Privacy", icon: "hand.raised.fill")
                    SettingsRow(title: "App Version", icon: "info.circle.fill")
                } header: { 
                    Text("ABOUT").font(.system(size: 10, weight: .black, design: .monospaced)).foregroundColor(.gray) 
                }
            }
            .scrollContentBackground(.hidden)
            .background(MilliColors.obsidian)
            .navigationTitle("Settings")
            .toolbarBackground(MilliColors.obsidian, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
        }
    }
}

struct SettingsRow: View {
    let title: String
    let icon: String
    
    var body: some View {
        HStack(spacing: 16) {
            ZStack {
                RoundedRectangle(cornerRadius: 8).fill(MilliColors.electricCyan.opacity(0.1))
                Image(systemName: icon).foregroundColor(MilliColors.electricCyan)
            }
            .frame(width: 36, height: 36)
            
            Text(title).font(.system(.body, design: .rounded)).foregroundColor(.white)
            Spacer()
            Image(systemName: "chevron.right").font(.system(size: 14, weight: .semibold)).foregroundColor(.gray.opacity(0.5))
        }
        .padding(.vertical, 4)
        .listRowBackground(MilliColors.carbon.opacity(0.5))
    }
}