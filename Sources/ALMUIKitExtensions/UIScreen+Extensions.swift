#if canImport(UIKit)
import UIKit

public extension UIScreen {
    static var is320PointsWide: Bool {
        UIScreen.main.bounds.width <= 320.0
    }

    static var hasNotch: Bool {
        let safeAreaInsetsTop = UIApplication.shared.delegate?.window??.safeAreaInsets.top ?? 0.0
        return safeAreaInsetsTop > 20.0
    }
}
#endif
