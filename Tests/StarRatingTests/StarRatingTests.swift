import XCTest
@testable import StarRating

class StarRatingTests: XCTestCase {

    var sut: StarRating!

    func test_given5stars_whenInit_rating() throws {
        // Given
        let starCount = 9

        // When
        sut = try! StarRating(
            maxStars: starCount
        )

        // Then
        XCTAssertEqual(sut.maxStars, starCount)
    }

    func test_givenNegativeMinStars_whenInit_ThenError() throws {
        // Given
        let minStars = -6

        do {
            // When
            _ = try StarRating(
                minStars: minStars
            )
        } catch let error as StarRatingError {
            // Then
            XCTAssertEqual(error, StarRatingError.negativeMinStars)
        }
    }

    func test_givenNegativeMaxStars_whenInit_ThenError() throws {
        // Given
        let maxStars = -3

        do {
            // When
            _ = try StarRating(
                maxStars: maxStars
            )
        } catch let error as StarRatingError {
            // Then
            XCTAssertEqual(error, StarRatingError.negativeMaxStars)
        }
    }

    func test_givenSmallerMaxStars_whenInit_ThenError() throws {
        // Given
        let minStars = 9
        let maxStars = 6

        do {
            // When
            _ = try StarRating(
                minStars: minStars,
                maxStars: maxStars
            )
        } catch let error as StarRatingError {
            // Then
            XCTAssertEqual(error, StarRatingError.maxStarsLowerThanMinStars)
        }
    }
}
