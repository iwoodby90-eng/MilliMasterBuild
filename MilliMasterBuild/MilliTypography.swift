import SwiftUI

struct MilliFont {
    // Sora: Headers and Financial Values
    static func sora(size: CGFloat, weight: Font.Weight) -> Font {
        .custom("Sora", size: size).weight(weight)
    }
    
    // Inter: Body and Metadata
    static func inter(size: CGFloat, weight: Font.Weight) -> Font {
        .custom("Inter", size: size).weight(weight)
    }
    
    // Standardized Modifiers
    static func monetary(size: CGFloat, weight: Font.Weight = .black) -> some ViewModifier {
        MonetaryModifier(size: size, weight: weight)
    }
}

struct MonetaryModifier: ViewModifier {
    let size: CGFloat
    let weight: Font.Weight
    
    func body(content: Content) -> some View {
        content
            .font(MilliFont.sora(size: size, weight: weight))
            .monospacedDigit()
    }
}