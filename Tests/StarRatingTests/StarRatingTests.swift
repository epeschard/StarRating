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

    func test_givenDefault_whenRate_thenRatingUpdates() throws {
        // Given
        let rating: Float = 4.2

        sut = try! StarRating()

        // When
        sut.value = rating

        // Then
        XCTAssertEqual(sut.value, rating)
    }

    func test_givenDefault_whenRateIncrease_thenDelegateNotifies() throws {
        // Given
        let rating: Float = 4.0

        sut = try! StarRating()
        let delegate = MockStarRatingDelegate()
        sut.delegate = delegate

        // When
        sut.value = rating

        // Then
        XCTAssertTrue(delegate.adjustableIncrementWasCalled)
    }

    func test_givenDefault_whenRateDecrease_thenDelegateNotifies() throws {
        // Given
        let rating: Float = 4.0

        sut = try! StarRating()
        let delegate = MockStarRatingDelegate()
        sut.delegate = delegate

        // When
        sut.value = rating

        // Then
        XCTAssertTrue(delegate.adjustableIncrementWasCalled)
    }
}
