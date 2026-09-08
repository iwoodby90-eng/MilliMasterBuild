import Foundation
import SwiftData

@Model
final class Payout {
    @Attribute(.unique) var id: UUID
    @Attribute(.encrypt) var amount: Double
    var date: Date
    var status: String
    var sourcePlatform: String // e.g., "Uber", "DoorDash"
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
    var balance: Double
    var lastUpdated: Date
    
    init(balance: Double) {
        self.id = UUID()
        self.balance = balance
        self.lastUpdated = Date()
    }
}