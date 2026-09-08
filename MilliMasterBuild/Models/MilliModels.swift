import Foundation
import SwiftData

@Model
final class TaxVault {
    @Attribute(.unique) var id: UUID
    var name: String
    var amount: Double
    var date: Date
    var status: String // "settled", "processing", "failed", "returned"
    
    init(name: String, amount: Double, date: Date, status: String = "settled") {
        self.id = UUID()
        self.name = name
        self.amount = amount
        self.date = date
        self.status = status
    }
}