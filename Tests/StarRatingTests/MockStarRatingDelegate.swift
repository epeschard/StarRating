import Foundation
@testable import StarRating

class MockStarRatingDelegate: StarRatingDelegate {
    var updateWasCalled: Bool = false

    func didUpdate(rating: Float) {
        updateWasCalled = true
    }
}
