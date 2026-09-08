import Foundation
import SwiftData

@Model
final class Payout {
    @Attribute(.unique) var id: UUID
    var amount: Double
    var date: Date
    var sourcePlatform: String
    
    init(amount: Double, date: Date, sourcePlatform: String) {
        self.id = UUID()
        self.amount = amount
        self.date = date
        self.sourcePlatform = sourcePlatform
    }
}

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

@Model
final class TaxVault {
    @Attribute(.unique) var id: UUID
    var name: String
    var amount: Double
    var date: Date
    
    init(name: String, amount: Double, date: Date) {
        self.id = UUID()
        self.name = name
        self.amount = amount
        self.date = date
    }
}