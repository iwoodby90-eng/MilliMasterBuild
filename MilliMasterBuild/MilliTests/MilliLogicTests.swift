import XCTest
@testable import Milli
import Foundation

final class MilliLogicTests: XCTestCase {
    
    func testAvailableToSpendCalculation() {
        let payout = Payout(amount: 100.0, date: Date(), status: .completed, source: "Uber", tax: 20.0)
        let available = payout.amount - payout.taxWithheld
        XCTAssertEqual(available, 80.0, "Available balance should be gross minus tax")
    }
    
    func testTaxVaultStateTransitions() {
        let vault = TaxVault(amount: 50.0, name: "Q3 Tax", status: "requested")
        XCTAssertEqual(vault.status, "requested")
        
        vault.status = "settled"
        XCTAssertEqual(vault.status, "settled", "Vault should transition to settled state")
    }
    
    func testPayoutArithmetic() {
        let p1 = Payout(amount: 100.0, date: Date(), status: .completed, source: "Uber", tax: 10.0)
        let p2 = Payout(amount: 50.0, date: Date(), status: .completed, source: "Lyft", tax: 5.0)
        
        let totalGross = p1.amount + p2.amount
        let totalTax = p1.taxWithheld + p2.taxWithheld
        
        XCTAssertEqual(totalGross, 150.0)
        XCTAssertEqual(totalTax, 15.0)
    }
}