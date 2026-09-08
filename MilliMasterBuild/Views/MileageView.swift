import SwiftUI
import MapKit
import SwiftData

struct MileageView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \MileageEntry.timestamp, order: .reverse) private var entries: [MileageEntry]
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $region)
                .preferredColorScheme(.dark)
                .colorMultiply(MilliColors.obsidian.opacity(0.8))
                .overlay(
                    LinearGradient(colors: [MilliColors.obsidian, .clear], startPoint: .bottom, endPoint: .top)
                        .frame(height: 200)
                        .frame(maxHeight: .infinity, alignment: .bottom)
                )
            
            VStack(spacing: 20) {
                Text("MILEAGE TRACKING")
                    .font(.system(size: 12, weight: .bold, design: .monospaced))
                    .foregroundColor(MilliColors.electricCyan)
                    .padding(.top, 60)
                
                ScrollView {
                    LazyVStack(spacing: 12) {
                        ForEach(entries) { entry in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(entry.locationName)
                                        .font(.system(size: 16, weight: .semibold))
                                        .foregroundColor(.white)
                                    Text(entry.timestamp, style: .date)
                                        .font(.caption2)
                                        .foregroundColor(.gray)
                                }
                                Spacer()
                                Text("\(entry.distance, specifier: "%.1f") mi")
                                    .font(.system(size: 16, weight: .bold, design: .rounded))
                                    .foregroundColor(MilliColors.electricCyan)
                            }
                            .padding()
                            .background(MilliColors.carbon.opacity(0.6))
                            .cornerRadius(16)
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
        .ignoresSafeArea()
    }
}