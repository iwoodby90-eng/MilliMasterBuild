import SwiftUI
import SwiftData

struct MileageView: View {
    @Query(sort: \MileageEntry.date, order: .reverse) private var entries: [MileageEntry]
    
    var body: some View {
        NavigationStack {
            ZStack {
                MilliColors.obsidian.ignoresSafeArea()
                
                List {
                    ForEach(entries) { entry in
                        HStack {
                            VStack(alignment: .leading, spacing: 4) {
                                Text(entry.purpose)
                                    .font(.headline)
                                    .foregroundColor(.white)
                                Text(entry.date, style: .date)
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                            Text("\(entry.distance, specifier: "%.1f") mi")
                                .font(.system(.body, design: .monospaced).bold())
                                .foregroundColor(MilliColors.electricCyan)
                        }
                        .listRowBackground(MilliColors.carbon)
                    }
                }
                .scrollContentBackground(.hidden)
            }
            .navigationTitle("Mileage Log")
            .toolbarColorScheme(.dark, for: .navigationBar)
        }
    }
}