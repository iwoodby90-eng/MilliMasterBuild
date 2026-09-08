import SwiftUI
import SwiftData

struct MileageView: View {
    @Query(sort: \MileageEntry.date, order: .reverse) private var entries: [MileageEntry]
    
    var body: some View {
        ZStack {
            MilliColors.obsidian.ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 20) {
                Text("MILEAGE LOG")
                    .font(.system(size: 10, weight: .black, design: .monospaced))
                    .tracking(6)
                    .foregroundColor(MilliColors.electricCyan)
                    .padding(.horizontal)
                
                List(entries) { entry in
                    HStack {
                        Text(entry.purpose)
                            .font(.system(.body, design: .rounded))
                        Spacer()
                        Text("\(Int(entry.distance)) mi")
                            .font(.system(.body, design: .monospaced).bold())
                            .foregroundColor(MilliColors.electricCyan)
                    }
                    .listRowBackground(MilliColors.carbon.opacity(0.5))
                }
                .scrollContentBackground(.hidden)
            }
            .padding(.top, 20)
        }
    }
}