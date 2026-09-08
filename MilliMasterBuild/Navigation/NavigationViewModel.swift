import SwiftUI
import MapKit
import Combine

@MainActor
class NavigationViewModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var searchResults: [MKMapItem] = []
    @Published var selectedRoute: MKRoute?
    @Published var isSearching = false
    
    private var localSearch: MKLocalSearch?
    
    func search(in region: MKCoordinateRegion) {
        guard !searchText.isEmpty else { return }
        isSearching = true
        
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchText
        request.region = region
        
        localSearch = MKLocalSearch(request: request)
        localSearch?.start { [weak self] response, _ in
            self?.searchResults = response?.mapItems ?? []
            self?.isSearching = false
        }
    }
    
    func calculateRoute(from source: CLLocationCoordinate2D, to destination: MKMapItem) async {
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: source))
        request.destination = destination
        request.transportType = .automobile
        
        let directions = MKDirections(request: request)
        do {
            let response = try await directions.calculate()
            self.selectedRoute = response.routes.first
        } catch {
            self.selectedRoute = nil
        }
    }
}