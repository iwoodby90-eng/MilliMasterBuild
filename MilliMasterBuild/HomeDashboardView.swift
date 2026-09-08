import SwiftUI
import SwiftData

struct HomeDashboardView: View {
    @Query(sort: \Payout.date, order: .reverse) private var payouts: [Payout]
    @Query(sort: \TaxVault.date, order: .reverse) private var taxVaults: [TaxVault]
    @StateObject private var viewModel = MilliViewModel()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                header
                availableToSpend
                latestPayoutSection
                taxVaultSection
                taxReadyScoreSection
                financialTimelineSection
                mileageSnapshotSection
                retirementSection
                investingSection
                wealthTeaserSection
                milliAIInsightSection
            }
            .padding(24)
            .padding(.bottom, 100)
        }
        .background(MilliColors.obsidian.ignoresSafeArea())
    }
    
    private var header: some View {
        HStack {
            Text("MILLI").font(MilliFont.sora(size: 14, weight: .black)).tracking(4)
            Spacer()
            Image(systemName: "bell.badge").foregroundColor(MilliColors.electricCyan)
        }
        .padding(.top)
    }
    
    private var availableToSpend: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("AVAILABLE TO SPEND").font(MilliFont.inter(size: 10, weight: .bold)).foregroundColor(.gray)
            Text(viewModel.totalBalance, format: .currency(code: "USD"))
                .font(MilliFont.sora(size: 44, weight: .black))
                .monospacedDigit()
        }
    }
    
    private var latestPayoutSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("LATEST PAYOUT").font(MilliFont.inter(size: 10, weight: .bold)).foregroundColor(.gray)
            if let latest = payouts.first {
                MilliFinancialCard(payout: latest)
            } else {
                Text("No recent payouts").font(MilliFont.inter(size: 12)).foregroundColor(.gray)
            }
        }
    }
    
    private var taxVaultSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("MILLI TAX VAULT™").font(MilliFont.inter(size: 10, weight: .bold)).foregroundColor(.gray)
            let total = taxVaults.reduce(0) { $0 + $1.amount }
            MilliMetricCard(title: "ESTIMATED SAVINGS", value: total.formatted(.currency(code: "USD")), status: "SYNCED")
        }
    }
    
    private var taxReadyScoreSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("TAX READY SCORE™").font(MilliFont.inter(size: 10, weight: .bold)).foregroundColor(.gray)
            MilliMetricCard(title: "COMPLIANCE INDEX", value: "98.2", status: "OPTIMAL")
        }
    }
    
    private var financialTimelineSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("FINANCIAL TIMELINE").font(MilliFont.inter(size: 10, weight: .bold)).foregroundColor(.gray)
            Text("All systems nominal").font(MilliFont.inter(size: 12)).foregroundColor(.gray)
        }
    }
    
    private var mileageSnapshotSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("MILEAGE SNAPSHOT").font(MilliFont.inter(size: 10, weight: .bold)).foregroundColor(.gray)
            MilliMetricCard(title: "TOTAL MILES", value: "1,240 mi", status: "TRACKING")
        }
    }
    
    private var retirementSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("RETIREMENT").font(MilliFont.inter(size: 10, weight: .bold)).foregroundColor(.gray)
            Text("Projected: $0.00 (Demo)").font(MilliFont.inter(size: 12)).foregroundColor(.gray)
        }
    }
    
    private var investingSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("INVESTING").font(MilliFont.inter(size: 10, weight: .bold)).foregroundColor(.gray)
            Text("Portfolio: Unavailable").font(MilliFont.inter(size: 12)).foregroundColor(.gray)
        }
    }
    
    private var wealthTeaserSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("TREE OF LIFE").font(MilliFont.inter(size: 10, weight: .bold)).foregroundColor(.gray)
            Text("Grow your wealth").font(MilliFont.inter(size: 12)).foregroundColor(.gray)
        }
    }
    
    private var milliAIInsightSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("MILLI AI INSIGHT").font(MilliFont.inter(size: 10, weight: .bold)).foregroundColor(.gray)
            Text("Scanning financial vitals...").font(MilliFont.inter(size: 12)).foregroundColor(.gray)
        }
    }
}