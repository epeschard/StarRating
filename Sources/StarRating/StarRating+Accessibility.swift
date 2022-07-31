import UIKit

public protocol AdjustableForAccessibilityDelegate: AnyObject {
    func adjustableDecrementFor(_ view: StarRating)
    func adjustableIncrementFor(_ view: StarRating)
}

extension StarRating {
    public override var isAccessibilityElement: Bool {
        get { return true }
        set { }
    }

    public override var accessibilityTraits: UIAccessibilityTraits {
        get { return .adjustable }
        set { }
    }

    public override func accessibilityIncrement() {
        delegate?.adjustableIncrementFor(self)
    }

    public override func accessibilityDecrement() {
        delegate?.adjustableDecrementFor(self)
    }
}
