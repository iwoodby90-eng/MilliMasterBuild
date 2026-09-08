import SwiftUI

struct MilliSettingsView: View {
    @AppStorage("biometricEnabled") private var biometricEnabled = true
    
    var body: some View {
        List {
            Section(header: Text("SECURITY").font(.system(size: 10, design: .monospaced))) {
                Toggle("Enable FaceID", isOn: $biometricEnabled)
                    .tint(MilliColors.electricCyan)
            }
            .listRowBackground(MilliColors.carbon)
            
            Section(header: Text("ACCOUNT").font(.system(size: 10, design: .monospaced))) {
                Button("Export Data") {}.foregroundColor(.white)
                Button("Delete Account") {}.foregroundColor(.red)
            }
            .listRowBackground(MilliColors.carbon)
        }
        .scrollContentBackground(.hidden)
        .background(MilliColors.obsidian)
    }
}