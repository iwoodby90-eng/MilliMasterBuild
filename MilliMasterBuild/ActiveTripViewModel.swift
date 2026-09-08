import SwiftUI
import CoreLocation
import Combine
import MapKit

enum TripState {
    case idle, acquiring, tracking, paused, stopped, degraded, unavailable, denied
}

@MainActor
class ActiveTripViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var state: TripState = .idle
    @Published var elapsedSeconds: TimeInterval = 0
    @Published var distance: Double = 0.0
    @Published var currentSpeed: Double = 0.0
    @Published var accuracy: Double = 0.0
    @Published var routePoints: [CLLocationCoordinate2D] = []
    @Published var region: MKCoordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194),
        span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
    )
    
    private var locationManager = CLLocationManager()
    private var timer: AnyCancellable?
    private var lastLocation: CLLocation?
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        locationManager.activityType = .automotiveNavigation
        locationManager.distanceFilter = 10 // Update every 10 meters
    }
    
    func startTrip() {
        state = .acquiring
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func pauseTrip() {
        state = .paused
        timer?.cancel()
    }
    
    func stopTrip() {
        state = .stopped
        timer?.cancel()
        locationManager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last, state != .paused else { return }
        
        if location.horizontalAccuracy < 0 || location.horizontalAccuracy > 50 {
            state = .degraded
            return
        }
        
        if state == .acquiring || state == .degraded {
            state = .tracking
            startTimer()
        }
        
        // Update Route
        routePoints.append(location.coordinate)
        
        // Update Region
        withAnimation {
            region = MKCoordinateRegion(
                center: location.coordinate,
                span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
            )
        }
        
        if let last = lastLocation {
            distance += location.distance(from: last) * 0.000621371
        }
        
        lastLocation = location
        currentSpeed = location.speed * 2.23694
        accuracy = location.horizontalAccuracy
    }
    
    private func startTimer() {
        timer = Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in self?.elapsedSeconds += 1 }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .denied, .restricted: state = .denied
        case .notDetermined: break
        default: break
        }
    }
}