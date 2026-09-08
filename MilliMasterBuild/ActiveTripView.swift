import SwiftUI
import MapKit

struct ActiveTripView: View {
    @StateObject private var viewModel = ActiveTripViewModel()
    
    var body: some View {
        ZStack {
            // Map Layer
            Map(coordinateRegion: $viewModel.region, showsUserLocation: true)
                .overlay(alignment: .topTrailing) {
                    Button {
                        // Recenter logic
                    } label: {
                        Image(systemName: "location.fill")
                            .padding(12)
                            .background(MilliColors.carbon)
                            .clipShape(Circle())
                    }
                    .padding()
                }
            
            // UI Overlay
            VStack(spacing: 24) {
                // Header
                HStack {
                    Circle().fill(viewModel.state == .tracking ? Color.green : Color.red).frame(width: 8, height: 8)
                    Text(viewModel.state == .tracking ? "LIVE" : "IDLE").font(.caption.bold())
                    Spacer()
                    Text("TRIP TRACKING").font(.caption.bold()).foregroundColor(.gray)
                }
                .padding(24)
                .background(.ultraThinMaterial)
                
                Spacer()
                
                // Metrics
                VStack(spacing: 16) {
                    HStack(spacing: 16) {
                        MilliMetricCard(title: "TIME", value: formatTime(viewModel.elapsedSeconds), status: "ELAPSED")
                        MilliMetricCard(title: "MILES", value: String(format: "%.2f", viewModel.distance), status: "TRACKED")
                    }
                    
                    HStack(spacing: 16) {
                        MilliMetricCard(title: "SPEED", value: String(format: "%.0f mph", viewModel.currentSpeed), status: "CURRENT")
                        MilliMetricCard(title: "DEDUCTION", value: String(format: "$%.2f", viewModel.distance * 0.67), status: "ESTIMATED")
                    }
                }
                .padding(24)
                
                // Controls
                HStack(spacing: 16) {
                    Button(viewModel.state == .paused ? "Resume" : "Pause") { viewModel.pauseTrip() }
                        .buttonStyle(.borderedProminent)
                    Button("Stop Trip") { viewModel.stopTrip() }
                        .foregroundColor(.red)
                }
                .padding(24)
                .background(MilliColors.obsidian)
            }
        }
        .background(MilliColors.obsidian.ignoresSafeArea())
    }
    
    private func formatTime(_ seconds: TimeInterval) -> String {
        let mins = Int(seconds) / 60
        let secs = Int(seconds) % 60
        return String(format: "%02d:%02d", mins, secs)
    }
}