import UIKit
import StarRating

public final class RatingViewController: UIViewController {

    let ratingView = try! StarRating(maxStars: 7)

    public override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        layout()
        setupAccessibility()
    }
}

private extension RatingViewController {

    func setup() {
        self.view.backgroundColor = .white
        self.view.addSubview(ratingView)
    }

    func layout() {
        ratingView.translatesAutoresizingMaskIntoConstraints = false
        ratingView.centerXAnchor.constraint(
            equalTo: view.centerXAnchor
        ).isActive = true
        ratingView.centerYAnchor.constraint(
            equalTo: view.centerYAnchor
        ).isActive = true
    }

    func setupAccessibility() {
        ratingView.delegate = self
        ratingView.accessibilityLabel = ID.A11y.label
        ratingView.accessibilityValue = String(
            format: ID.A11y.valueFormat,
            arguments: [
                ratingView.value,
                ratingView.maxStars
            ]
        )
    }
}

extension RatingViewController: AdjustableForAccessibilityDelegate {
    public func adjustableDecrementFor(_ view: StarRating) {
        didUpdate(
            rating: Int(view.value),
            message: ID.A11y.Alert.messageDecrease
        )
    }

    public func adjustableIncrementFor(_ view: StarRating) {
        didUpdate(
            rating: Int(view.value),
            message: ID.A11y.Alert.messageIncrease
        )
    }

    private func didUpdate(rating: Int, message: String) {
        let alert = UIAlertController(
            title: ID.A11y.Alert.title,
            message: message + String(rating),
            preferredStyle: .alert
        )
        let dismiss = UIAlertAction(
            title: ID.A11y.Alert.dismissTitle,
            style: .cancel,
            handler: nil
        )
        alert.addAction(dismiss)
        self.present(alert, animated: true)
    }
}

