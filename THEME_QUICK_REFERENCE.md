# Quick Reference: Using the New Theme System

## Common Patterns

### 1. Navigation Cards (for main menu options)

```swift
NavigationLink {
    DestinationView()
} label: {
    HStack {
        Image(systemName: "figure.run")
            .font(.title2)
        Text("Menu Item Title")
        Spacer()
        Image(systemName: "chevron.right")
            .font(.caption)
            .fontWeight(.bold)
    }
}
.navigationCardStyle()
```

### 2. Info Cards (for displaying grouped information)

```swift
VStack(alignment: .leading, spacing: 12) {
    // Title
    HStack {
        Image(systemName: "info.circle")
            .foregroundColor(AppTheme.primaryAccent)
        Text("Card Title")
            .fontWeight(.bold)
    }
    
    Divider()
    
    // Content
    Text("Your content here")
}
.cardStyle()
```

### 3. Stat Rows (for key-value pairs with icons)

```swift
HStack(spacing: 12) {
    Image(systemName: "calendar")
        .foregroundColor(AppTheme.primaryAccent)
        .frame(width: 24)
    
    VStack(alignment: .leading, spacing: 2) {
        Text("Label")
            .font(.caption)
            .foregroundColor(.secondary)
        Text("Value")
            .fontWeight(.medium)
            .foregroundColor(.primary)
    }
    
    Spacer()
}
```

### 4. Expandable Sections

```swift
@State private var isExpanded = false

VStack(alignment: .leading, spacing: 12) {
    Button(action: {
        withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
            isExpanded.toggle()
        }
    }) {
        HStack {
            Image(systemName: "info.circle.fill")
                .foregroundColor(AppTheme.primaryAccent)
            Text(isExpanded ? "Hide Details" : "Show Details")
                .fontWeight(.medium)
            Spacer()
            Image(systemName: "chevron.down")
                .rotationEffect(.degrees(isExpanded ? 180 : 0))
                .animation(.spring(response: 0.3, dampingFraction: 0.7), value: isExpanded)
        }
        .foregroundColor(AppTheme.primaryAccent)
    }
    
    if isExpanded {
        // Expandable content here
    }
}
.cardStyle()
```

### 5. Action Buttons (for preset selections)

```swift
Text("Option")
    .padding(5)
    .bold()
    .foregroundColor(.white)
    .background(AppTheme.primaryAccent)
    .cornerRadius(10)
    .onTapGesture {
        // Action
    }
```

### 6. Icon Buttons

```swift
Image(systemName: "questionmark.circle")
    .foregroundColor(AppTheme.primaryAccent)
    .onTapGesture {
        // Action
    }
```

### 7. ScrollView with Cards

```swift
NavigationView {
    ScrollView {
        VStack(spacing: AppTheme.cardSpacing) {
            // Multiple navigation cards
            // Card 1
            NavigationLink { ... } label: { ... }
                .navigationCardStyle()
            
            // Card 2
            NavigationLink { ... } label: { ... }
                .navigationCardStyle()
            
            // Info card
            VStack { ... }
                .cardStyle()
        }
        .padding()
    }
    .navigationTitle("Title")
}
```

## Color Reference

```swift
// Use these instead of hardcoded colors
AppTheme.primaryAccent     // Main blue color
AppTheme.secondaryAccent   // Lighter blue
AppTheme.primaryGradient   // Gradient for buttons
```

## Spacing Reference

```swift
// Use these for consistent spacing
AppTheme.cardPadding      // 16pt - padding inside cards
AppTheme.cardSpacing      // 12pt - spacing between cards
AppTheme.cornerRadius     // 16pt - corner radius for cards
```

## Typography Reference

```swift
// Use these for consistent typography
AppTheme.titleFont        // .title2 - for headings
AppTheme.bodyFont         // .body - for body text
AppTheme.captionFont      // .caption - for secondary text
```

## Animation Reference

```swift
// Use spring animations for smooth motion
withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
    // Your state changes
}
```

## Dark Mode

All theme components automatically adapt to dark mode:
- `.cardStyle()` uses adaptive backgrounds
- Accent colors work in both light and dark modes
- System colors are preferred for text (`.primary`, `.secondary`)

## Migration Checklist

When updating existing views:

- [ ] Replace `.blue` with `AppTheme.primaryAccent`
- [ ] Replace custom button styling with `.navigationCardStyle()`
- [ ] Replace stroked borders with `.cardStyle()`
- [ ] Update spacing to use `AppTheme.cardSpacing`
- [ ] Add chevron indicators to navigation links
- [ ] Use consistent icon + text layouts
- [ ] Add spring animations to interactive elements
- [ ] Test in both light and dark modes
