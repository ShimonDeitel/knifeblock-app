import SwiftUI

enum Theme {
    static let accent = Color(red: 0.6157, green: 0.5059, blue: 0.5373)
    static let background = Color(red: 0.0784, green: 0.0627, blue: 0.0627)
    static let card = Color(red: 0.1333, green: 0.1059, blue: 0.1059)
    static let textPrimary = Color(red: 0.9569, green: 0.9255, blue: 0.9255)
    static let textMuted = Color(red: 0.7843, green: 0.7020, blue: 0.7176)

    static let titleFont = Font.system(.title2, design: .serif).weight(.bold)
    static let bodyFont = Font.system(.body, design: .rounded)
    static let labelFont = Font.system(.caption, design: .rounded).weight(.semibold)
}
