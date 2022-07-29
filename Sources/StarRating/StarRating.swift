import UIKit

/// An object that displays a StarRating UI component in your interface.
public final class StarRating: UIView {
    private(set) var minStars: Int
    private(set) var maxStars: Int

    public init(
        minStars: Int = 1,
        maxStars: Int = 5,
        insets: UIEdgeInsets = .zero
    ) {
        self.minStars = minStars
        self.maxStars = maxStars

        super.init(frame: .zero)

        setup()
        layout(with: insets)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
    func setup() {
        self.addSubview(self.stackView)
        for _ in minStars...maxStars {
            let star = UIImageView(
                image: UIImage(systemName: "star")
            )
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
}
