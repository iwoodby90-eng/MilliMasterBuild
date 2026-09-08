import XCTest
@testable import Milli
import Foundation

final class MilliLogicTests: XCTestCase {
    
    func testAvailableToSpendCalculation() {
        let payout = Payout(amount: 100.0, date: Date(), status: .completed, source: "Uber")
        payout.taxWithheld = 20.0
        payout.retirementAllocation = 5.0
        payout.investingAllocation = 5.0
        payout.savingsAllocation = 10.0
        
        // 100 - 20 - 5 - 5 - 10 = 60
        XCTAssertEqual(payout.availableToSpend, 60.0, "Available balance should be gross minus all allocations")
    }
    
    func testTaxVaultProgressCalculation() {
        let annualTarget = 1000.0
        let ledger = [
            TaxVault(name: "Q1", amount: 250.0, date: Date(), status: "settled"),
            TaxVault(name: "Q2", amount: 250.0, date: Date(), status: "processing")
        ]
        
        let settledBalance = ledger.filter { $0.status == "settled" }.reduce(0) { $0 + $1.amount }
        let progress = settledBalance / annualTarget
        
        XCTAssertEqual(settledBalance, 250.0, "Processing amounts should not be included in settled balance")
        XCTAssertEqual(progress, 0.25, "Progress should be 25% based on settled balance")
    }
    
    func testPayoutArithmetic() {
        let p1 = Payout(amount: 100.0, date: Date(), status: .completed, source: "Uber")
        let p2 = Payout(amount: 50.0, date: Date(), status: .completed, source: "Lyft")
        
        let payouts = [p1, p2]
        let totalGross = payouts.reduce(0) { $0 + $1.amount }
        
        XCTAssertEqual(totalGross, 150.0, "Total gross should sum all payout amounts")
    }
    
    func testProvenanceAndStateHandling() {
        let payout = Payout(amount: 100.0, date: Date(), status: .completed, source: "Uber", provenance: "Manual")
        
        XCTAssertEqual(payout.provenance, "Manual")
        XCTAssertEqual(payout.status, "completed")
    }
}