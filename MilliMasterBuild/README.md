markdown
# 🚀 Security Configuration Update

To ensure the highest level of security for your financial data, the app now uses `deviceOwnerAuthentication`, which supports both Biometrics (FaceID/TouchID) and Device Passcode.

## 🔐 Required Info.plist Keys

Add these keys to your Xcode project's **Info** tab to enable secure authentication:

1. **NSFaceIDUsageDescription**
   - **Value:** "Milli requires FaceID to secure your financial data."

2. **NSBiometricsUsageDescription** (Optional, for older iOS versions)
   - **Value:** "Milli requires biometric authentication to access your account."

## 🛡️ Security Features Implemented
- **Hardware-Backed Encryption**: SwiftData models use `@Attribute(.encrypt)` for sensitive fields.
- **Biometric/Passcode Gate**: The app uses `LAContext` to enforce authentication before rendering the dashboard.
- **Auto-Lock**: The app automatically calls `security.lock()` when the `scenePhase` changes to `.background` or `.inactive`, ensuring data is protected when the user leaves the app.