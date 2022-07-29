import XCTest
@testable import StarRating

class StarRatingTests: XCTestCase {

    var sut: StarRating!

    func test_given5stars_whenInit_rating() throws {
        // Given
        let starCount = 9

        // When
        sut = StarRating(
            maxStars: starCount
        )

        // Then
        XCTAssertEqual(sut.maxStars, starCount)
    }

}
