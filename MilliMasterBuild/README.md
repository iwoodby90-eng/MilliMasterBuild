markdown
# Milli Master Build

## Product Overview
Milli is a high-precision financial management platform for independent earners.

## Canonical Navigation
- Payouts (Wallet)
- Mileage (Navigation Arrow)
- Home (Center M)
- Wealth (Money Bag)
- More (Ellipsis)

## Tech Stack
- SwiftUI
- SwiftData
- Combine

## Architecture
MVVM (Model-View-ViewModel) with centralized design tokens.

## Financial Truth Rules
- All values must be backed by real state or explicitly marked as DEMO.
- No hard-coded financial values in production code.

## Design System
- Typography: Sora (Displays/Numbers), Inter (Body/Metadata).
- Colors: Obsidian (Background), Carbon (Surface), Electric Cyan (Accent).

## Environment Setup
- Xcode 16+
- iOS 17+
- Plaid API integration required for live data.

## Build Instructions
1. Open `MilliMasterBuild.xcodeproj` in Xcode 16+.
2. Ensure all dependencies are resolved.
3. Run on iOS 17+ Simulator.

## Test Instructions
- Run unit tests via Cmd+U.
- Verify UI via Preview or Simulator.

## Visual Reference Precedence
- Hardware-inspired navigation components take precedence over standard UI.

## Definition of Done
- Navigation visually matches hardware reference.
- Home dashboard sections are fully implemented with real state.
- Unit tests pass for all financial calculations.