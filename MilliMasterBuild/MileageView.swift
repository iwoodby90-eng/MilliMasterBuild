import SwiftUI
import SwiftData

struct MileageView: View {
    @Query(sort: \MileageEntry.date, order: .reverse) private var entries: [MileageEntry]
    
    private let irsRate: Double = 0.67
    
    var businessMiles: Double { entries.filter { $0.category == "business" }.reduce(0) { $0 + $1.distance } }
    var personalMiles: Double { entries.filter { $0.category == "personal" }.reduce(0) { $0 + $1.distance } }
    var totalDeduction: Double { businessMiles * irsRate }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Header
                VStack(alignment: .leading, spacing: 8) {
                    Text("MILEAGE OVERVIEW").font(MilliFont.inter(size: 10, weight: .bold)).foregroundColor(.gray)
                    Text("\(Int(businessMiles + personalMiles)) mi").font(MilliFont.sora(size: 44, weight: .black)).monospacedDigit()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                // Metrics
                HStack(spacing: 16) {
                    MilliMetricCard(title: "BUSINESS", value: "\(Int(businessMiles)) mi", status: "TRACKED")
                    MilliMetricCard(title: "DEDUCTION", value: totalDeduction.formatted(.currency(code: "USD")), status: "ESTIMATED")
                }
                
                // Actions
                HStack(spacing: 16) {
                    Button(action: {}) {
                        Label("Start Trip", systemImage: "play.fill").font(MilliFont.inter(size: 14, weight: .bold))
                            .frame(maxWidth: .infinity).padding().background(MilliColors.electricCyan).foregroundColor(.black).cornerRadius(MilliTokens.radius)
                    }
                    Button(action: {}) {
                        Label("Manual", systemImage: "plus").font(MilliFont.inter(size: 14, weight: .bold))
                            .frame(maxWidth: .infinity).padding().background(MilliColors.carbon).foregroundColor(.white).cornerRadius(MilliTokens.radius)
                    }
                }
                
                // Recent Trips
                VStack(alignment: .leading, spacing: 16) {
                    Text("RECENT TRIPS").font(MilliFont.inter(size: 10, weight: .bold)).foregroundColor(.gray)
                    if entries.isEmpty {
                        Text("No trips recorded").font(MilliFont.inter(size: 12)).foregroundColor(.gray)
                    } else {
                        ForEach(entries) { entry in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(entry.purpose).font(MilliFont.inter(size: 14, weight: .medium))
                                    Text(entry.date, style: .date).font(MilliFont.inter(size: 10)).foregroundColor(.gray)
                                }
                                Spacer()
                                Text("\(Int(entry.distance)) mi").font(MilliFont.sora(size: 14, weight: .bold))
                                    .foregroundColor(entry.category == "business" ? MilliColors.electricCyan : .gray)
                            }
                            .padding()
                            .background(MilliColors.carbon)
                            .cornerRadius(MilliTokens.radius)
                        }
                    }
                }
            }
            .padding(24)
        }
        .background(MilliColors.obsidian.ignoresSafeArea())
    }
}