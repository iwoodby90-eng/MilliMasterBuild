import SwiftUI
import MapKit

struct NavigationView: View {
    @StateObject private var navModel = NavigationViewModel()
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $region, showsUserLocation: true)
            
            VStack {
                TextField("Search destination...", text: $navModel.searchText, onCommit: {
                    navModel.search(in: region)
                })
                .padding()
                .background(MilliColors.carbon)
                .cornerRadius(MilliTokens.radius)
                .padding()
                
                if !navModel.searchResults.isEmpty {
                    ScrollView {
                        ForEach(navModel.searchResults, id: \.self) { item in
                            Button(item.name ?? "Unknown") {
                                Task { await navModel.calculateRoute(from: region.center, to: item) }
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(MilliColors.carbon)
                        }
                    }
                    .frame(maxHeight: 200)
                    .padding(.horizontal)
                }
                
                Spacer()
                
                if let route = navModel.selectedRoute {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("ETA: \(Int(route.expectedTravelTime / 60)) min")
                            .font(MilliFont.sora(size: 20, weight: .bold))
                        Text("\(String(format: "%.1f", route.distance / 1609.34)) miles")
                            .font(MilliFont.inter(size: 14, weight: .medium))
                        
                        Button("Start Navigation") {
                            // Integration with ActiveTripViewModel
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(MilliColors.electricCyan)
                        .foregroundColor(.black)
                        .cornerRadius(MilliTokens.radius)
                    }
                    .padding(24)
                    .background(MilliColors.obsidian.opacity(0.9))
                }
            }
        }
        .background(MilliColors.obsidian.ignoresSafeArea())
    }
}