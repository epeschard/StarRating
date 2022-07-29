import Foundation

/// Shortcut notation to get `String.ID`
typealias ID = String.ID

extension String {
    /// Namespace to access all ID strings in the project
    enum ID {}
}

extension ID {
    /// Namespace to access all Image IDs
    enum Image {
        static let star = "star"
        static let filledStar = "star.fill"
    }
}

extension ID {
    /// Namespace to access all Coder strings
    enum Coder {
        static let fatalError = "init(coder:) has not been implemented"
    }
}
