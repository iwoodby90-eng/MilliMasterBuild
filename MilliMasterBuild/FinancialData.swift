import Foundation
import SwiftData

@Model
final class Payout {
    @Attribute(.unique) var id: UUID
    @Attribute(.encrypt) var amount: Double
    var date: Date
    var status: String
    var sourcePlatform: String
    var taxWithheld: Double
    
    init(amount: Double, date: Date, status: PayoutStatus, source: String, tax: Double) {
        self.id = UUID()
        self.amount = amount
        self.date = date
        self.status = status.rawValue
        self.sourcePlatform = source
        self.taxWithheld = tax
    }
}

enum PayoutStatus: String, Codable {
    case pending, completed, failed
}

@Model
final class TaxVault {
    @Attribute(.unique) var id: UUID
    var amount: Double
    var date: Date
    var name: String
    var status: String // requested, processing, settled, failed, returned, reversed, restricted, unavailable
    
    init(amount: Double, name: String, status: String = "settled") {
        self.id = UUID()
        self.amount = amount
        self.date = Date()
        self.name = name
        self.status = status
    }
}