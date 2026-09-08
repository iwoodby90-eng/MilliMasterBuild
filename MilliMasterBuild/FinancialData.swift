import Foundation
import SwiftData

@Model
final class Payout {
    @Attribute(.unique) var id: UUID
    var amount: Double
    var date: Date
    var status: String
    var sourcePlatform: String
    
    // Allocations
    var taxWithheld: Double?
    var retirementAllocation: Double?
    var investingAllocation: Double?
    var savingsAllocation: Double?
    
    var provenance: String // e.g., "Plaid", "Manual", "System"
    
    init(amount: Double, date: Date, status: PayoutStatus, source: String, provenance: String = "Plaid") {
        self.id = UUID()
        self.amount = amount
        self.date = date
        self.status = status.rawValue
        self.sourcePlatform = source
        self.provenance = provenance
    }
    
    var availableToSpend: Double {
        amount - (taxWithheld ?? 0) - (retirementAllocation ?? 0) - (investingAllocation ?? 0) - (savingsAllocation ?? 0)
    }
}

enum PayoutStatus: String, Codable {
    case pending, completed, failed, processing
}