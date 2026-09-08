import Foundation
import SwiftData

@Model
final class MileageEntry {
    @Attribute(.unique) var id: UUID
    var distance: Double
    var date: Date
    var purpose: String
    
    init(distance: Double, date: Date, purpose: String) {
        self.id = UUID()
        self.distance = distance
        self.date = date
        self.purpose = purpose
    }
}