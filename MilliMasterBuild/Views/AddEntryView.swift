import SwiftUI
import SwiftData

struct AddEntryView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @State private var distance: String = ""
    @State private var purpose: String = ""
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Mileage Details") {
                    TextField("Distance (miles)", text: $distance)
                        .keyboardType(.decimalPad)
                    TextField("Purpose (e.g. Client Visit)", text: $purpose)
                }
            }
            .navigationTitle("Log Mileage")
            .toolbar {
                Button("Save") {
                    let entry = MileageEntry(distance: Double(distance) ?? 0, date: Date(), purpose: purpose)
                    modelContext.insert(entry)
                    dismiss()
                }
            }
        }
    }
}