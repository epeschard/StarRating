import UIKit

/// An object that displays a StarRating UI component in your interface.
@MainActor
public final class StarRating: UIView {
    /// Rating score value for Star Rating UI component
    public var value: Float = 0.0 {
        didSet {
            guard
                oldValue != value
            else { return }

            if value < oldValue {
                delegate?.adjustableDecrementFor(self)
            } else if value > oldValue {
                delegate?.adjustableIncrementFor(self)
            }
            updateRating(value)
        }
    }
    public weak var delegate: AdjustableForAccessibilityDelegate?

    private(set) var minStars: Int
    private(set) public var maxStars: Int

    public init(
        minStars: Int = 1,
        maxStars: Int = 5,
        insets: UIEdgeInsets = .zero
    ) throws {
        guard minStars >= 0 else {
            throw StarRatingError.negativeMinStars
        }
        guard maxStars > 0 else {
            throw StarRatingError.negativeMaxStars
        }
        guard  maxStars > minStars else {
            throw StarRatingError.maxStarsLowerThanMinStars
        }

        self.minStars = minStars
        self.maxStars = maxStars

        super.init(frame: .zero)

        commonSetup()
        layout(with: insets)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(ID.Coder.fatalError)
    }

    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.spacing = 5
        return stackView
    }()
}

// MARK: - Private

private extension StarRating {
    func commonSetup() {
        setupStarRating()
        setupAccessibility()
    }

    func setupAccessibility() {
        isAccessibilityElement = true
        accessibilityTraits = .adjustable
        accessibilityValue = "\(value) stars out of \(maxStars)"
        accessibilityHint = ID.A11y.hint
        accessibilityLabel = ID.A11y.label
    }

    func setupStarRating() {
        self.addSubview(self.stackView)
        for rating in minStars...maxStars {
            let star = UIImageView(
                image: UIImage(systemName: ID.Image.star)
            )
            let tap = StarRatingTap(
                target: self,
                action: #selector(didTapStar(sender:))
            )
            tap.rating = rating
            star.addGestureRecognizer(tap)
            star.isUserInteractionEnabled = true
            stackView.addArrangedSubview(star)
        }
    }

    func layout(with insets: UIEdgeInsets) {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(
                equalTo: self.centerYAnchor
            ),
            stackView.centerXAnchor.constraint(
                equalTo: self.centerXAnchor
            ),
            stackView.topAnchor.constraint(
                lessThanOrEqualTo: self.topAnchor,
                constant: insets.top
            ),
            stackView.rightAnchor.constraint(
                lessThanOrEqualTo: self.rightAnchor,
                constant: insets.right
            ),
            stackView.bottomAnchor.constraint(
                lessThanOrEqualTo: self.bottomAnchor,
                constant: insets.bottom
            ),
            stackView.leftAnchor.constraint(
                lessThanOrEqualTo: self.leftAnchor,
                constant: insets.left
            ),
        ])
    }

    func updateRating(_ value: Float) {
        for (index, view) in stackView.arrangedSubviews.enumerated() {
            guard
                let star = view as? UIImageView
            else { return }

            if index < Int(value) {
                star.image = UIImage(systemName: ID.Image.filledStar)
            } else {
                star.image = UIImage(systemName: ID.Image.star)
            }
        }
        self.accessibilityValue = "\(value) stars out of \(maxStars)"
    }

    @objc
    func didTapStar(sender: StarRatingTap) {
        value = Float(sender.rating)
    }
}
