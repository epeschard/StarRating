import Foundation

public enum StarRatingError: Error {
    case negativeMinStars
    case negativeMaxStars
    case maxStarsLowerThanMinStars
}
