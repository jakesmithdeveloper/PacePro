# PacePro Styling Guide

## Overview
This document outlines the modern styling system implemented for PacePro to create a more intuitive and consistent user experience.

## Theme System

### Location
`PacePro/Extensions/Theme.swift`

### Components

#### Colors
- **Primary Accent**: `Color(red: 0.2, green: 0.5, blue: 1.0)` - Modern blue
- **Secondary Accent**: `Color(red: 0.3, green: 0.7, blue: 0.9)` - Lighter blue

#### Gradients
- **Primary Gradient**: Linear gradient from primary to secondary accent (top-leading to bottom-trailing)

#### Spacing Constants
- **Card Padding**: 16pt
- **Card Spacing**: 12pt
- **Corner Radius**: 16pt

#### Typography
- **Title Font**: `.title2`
- **Body Font**: `.body`
- **Caption Font**: `.caption`

### View Modifiers

#### `.cardStyle()`
Applies a modern card appearance with:
- Padding and rounded corners
- Adaptive background (white in light mode, gray in dark mode)
- Subtle shadow for depth

#### `.navigationCardStyle()`
Applies a gradient button style for navigation cards with:
- Primary gradient background
- White foreground text
- Consistent padding and sizing
- Shadow with accent color tint

## Usage Examples

### Navigation Buttons
```swift
NavigationLink {
    DestinationView()
} label: {
    HStack {
        Image(systemName: "icon.name")
            .font(.title2)
        Text("Button Title")
        Spacer()
        Image(systemName: "chevron.right")
            .font(.caption)
            .fontWeight(.bold)
    }
}
.navigationCardStyle()
```

### Info Cards
```swift
VStack(alignment: .leading, spacing: 12) {
    // Card content
}
.cardStyle()
```

## Design Principles

1. **Consistency**: All navigation buttons use the same gradient style
2. **Clarity**: Icons and chevrons provide clear visual cues
3. **Hierarchy**: Typography and spacing create clear information hierarchy
4. **Touch-friendly**: Larger tap targets with adequate spacing
5. **Animations**: Smooth spring animations for interactive elements
6. **Accessibility**: Maintains good contrast and respects system preferences

## Updated Views

### Main Navigation
- `ContentView.swift`: Enhanced tab bar with filled icons
- `PaceView.swift`: Modern navigation cards with improved info panel
- `DateCalculatorView.swift`: Consistent card-based navigation

### Supporting Views
- `CalendarStatsView.swift`: Modern card design with icons
- `CalendarCellView.swift`: Theme-aware cell colors
- `CalendarKeyView.swift`: Theme-aware legend colors
- `RaceEditView.swift`: Theme-aware icons
- `PresetDistanceView.swift`: Theme-aware buttons
- `TrackDistancePresets.swift`: Theme-aware preset buttons

## Migration Notes

### Replacing Old Styles
Before:
```swift
.foregroundColor(.blue)
.overlay {
    RoundedRectangle(cornerRadius: 20)
        .stroke(.blue, lineWidth: 5)
}
```

After:
```swift
.navigationCardStyle()
```

### Color References
Replace hardcoded `.blue` with `AppTheme.primaryAccent`

## Dark Mode Support
All styling automatically adapts to dark mode through:
- Environment-aware backgrounds in `.cardStyle()`
- System color adaptations
- Maintained accent colors that work in both modes
