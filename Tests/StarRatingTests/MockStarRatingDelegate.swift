import Foundation
@testable import StarRating

class MockStarRatingDelegate: AdjustableForAccessibilityDelegate {

    var adjustableDecrementWasCalled: Bool = false
    var adjustableIncrementWasCalled: Bool = false

    func adjustableDecrementFor(_ view: StarRating) {
        adjustableDecrementWasCalled = true
    }

    func adjustableIncrementFor(_ view: StarRating) {
        adjustableIncrementWasCalled = true
    }
}
