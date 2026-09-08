import SwiftUI

struct MilliCardView: View {
    @State private var isCardVisible = true
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 24) {
                header
                
                // Metal Card Display
                ZStack {
                    // Card Base with Metallic Gradient
                    RoundedRectangle(cornerRadius: 24)
                        .fill(
                            LinearGradient(
                                colors: [
                                    Color(red: 0.8, green: 0.8, blue: 0.85),
                                    Color(red: 0.5, green: 0.5, blue: 0.55),
                                    Color(red: 0.7, green: 0.7, blue: 0.75)
                                ],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(height: 220)
                        .overlay(
                            RoundedRectangle(cornerRadius: 24)
                                .stroke(LinearGradient(colors: [.white.opacity(0.5), .clear], startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2)
                        )
                        .shadow(color: .black.opacity(0.4), radius: 10, x: 0, y: 10)
                    
                    // Card Content
                    VStack(alignment: .leading, spacing: 20) {
                        HStack {
                            Text("MILLI").font(.system(size: 20, weight: .black, design: .monospaced)).foregroundColor(MilliColors.obsidian)
                            Spacer()
                            Image(systemName: "wave.3.right").foregroundColor(MilliColors.obsidian)
                        }
                        Spacer()
                        Text("•••• •••• •••• 8824").font(.system(size: 22, weight: .bold, design: .monospaced)).foregroundColor(MilliColors.obsidian)
                    }
                    .padding(30)
                }
                .padding(.horizontal)
                
                // Card Controls
                HStack(spacing: 16) {
                    cardButton(title: "Freeze", icon: "snowflake")
                    cardButton(title: "Details", icon: "eye.fill")
                    cardButton(title: "Limits", icon: "slider.horizontal.3")
                }
                .padding(.horizontal)
                
                // Recent Activity
                VStack(alignment: .leading, spacing: 16) {
                    Text("CARD ACTIVITY").font(.system(size: 10, weight: .bold, design: .monospaced)).foregroundColor(.gray)
                    ForEach(0..<3) { _ in
                        HStack {
                            Image(systemName: "cart.fill").foregroundColor(MilliColors.electricCyan)
                            Text("Apple Store").font(.system(.body, design: .rounded))
                            Spacer()
                            Text("-$1,299.00").font(.system(.body, design: .monospaced).bold())
                        }
                        .padding()
                        .background(MilliColors.carbon.opacity(0.5))
                        .cornerRadius(16)
                    }
                }
                .padding(.horizontal)
            }
            .padding(.top, 20)
            .padding(.bottom, 120)
        }
        .background(MilliColors.obsidian.ignoresSafeArea())
    }
    
    private var header: some View {
        Text("MILLI METAL").font(.system(size: 12, weight: .black, design: .monospaced)).tracking(6).foregroundColor(MilliColors.electricCyan)
    }
    
    private func cardButton(title: String, icon: String) -> some View {
        Button(action: {}) {
            VStack(spacing: 8) {
                Image(systemName: icon).font(.title3)
                Text(title).font(.system(size: 10, weight: .bold, design: .monospaced))
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .background(MilliColors.carbon)
            .cornerRadius(20)
        }
        .foregroundColor(.white)
    }
}