#if canImport(UIKit)
import UIKit

public extension UIButton {
    func setRightImage(_ image: UIImage?, padding: CGFloat = 20.0) {
        self.setImage(image, for: .normal)

        self.titleEdgeInsets = UIEdgeInsets(
            top: 0,
            left: -(self.imageView?.frame.width ?? 0.0),
            bottom: 0,
            right: (self.imageView?.frame.width ?? 0.0)
        )

        self.imageEdgeInsets = UIEdgeInsets(
            top: 0,
            left: (self.titleLabel?.frame.size.width ?? 0.0) + padding,
            bottom: 0,
            right: -(self.titleLabel?.frame.size.width ?? 0.0) - padding
        )
    }
}
#endif
