//
//  Theme.swift
//  PacePro
//
//  Created for PacePro styling redesign
//

import SwiftUI

// MARK: - App Theme
struct AppTheme {
    // Primary colors
    static let primaryAccent = Color(red: 0.2, green: 0.5, blue: 1.0) // Modern blue
    static let secondaryAccent = Color(red: 0.3, green: 0.7, blue: 0.9) // Lighter blue
    
    // Gradients
    static let primaryGradient = LinearGradient(
        colors: [primaryAccent, secondaryAccent],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    
    // Spacing
    static let cardPadding: CGFloat = 16
    static let cardSpacing: CGFloat = 12
    static let cornerRadius: CGFloat = 16
    
    // Typography
    static let titleFont: Font = .title2
    static let bodyFont: Font = .body
    static let captionFont: Font = .caption
}

// MARK: - Card Style ViewModifier
struct CardStyle: ViewModifier {
    @Environment(\.colorScheme) var colorScheme
    
    func body(content: Content) -> some View {
        content
            .padding(AppTheme.cardPadding)
            .background(
                RoundedRectangle(cornerRadius: AppTheme.cornerRadius)
                    .fill(colorScheme == .dark ? Color(.systemGray6) : Color.white)
                    .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 4)
            )
    }
}

// MARK: - Navigation Card Style
struct NavigationCardStyle: ViewModifier {
    @Environment(\.colorScheme) var colorScheme
    
    func body(content: Content) -> some View {
        content
            .font(AppTheme.titleFont)
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .padding(AppTheme.cardPadding)
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: AppTheme.cornerRadius)
                    .fill(AppTheme.primaryGradient)
                    .shadow(color: AppTheme.primaryAccent.opacity(0.3), radius: 8, x: 0, y: 4)
            )
    }
}

// MARK: - View Extensions
extension View {
    func cardStyle() -> some View {
        modifier(CardStyle())
    }
    
    func navigationCardStyle() -> some View {
        modifier(NavigationCardStyle())
    }
}
