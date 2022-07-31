import Foundation

/// Shortcut notation to get `String.ID`
public typealias ID = String.ID

extension String {
    /// Namespace to access all ID strings in the project
    public enum ID {}
}

extension ID {
    /// Namespace to access all Image IDs
    public enum Image {
        public static let star = "star"
        public static let filledStar = "star.fill"
    }
}

extension ID {
    /// Namespace to access all Coder strings
    public enum Coder {
        public static let fatalError = "init(coder:) has not been implemented"
    }
}

extension ID {
    /// Namespace to access all accessibility strings
    public enum A11y {
        public static let valueFormat = "%f stars out of %d"
        public static let hint = "tap a star to rate"
        public static let label = "star rating"
    }
}

extension ID.A11y {
    public enum Alert {
        public static let title = "Rating Update"
        public static let messageIncrease = "increased to"
        public static let messageDecrease = "decreased to"
        public static let alertTitle = "Rating Update"
        public static let dismissTitle = "OK"
    }
}
