#if canImport(UIKit)
import UIKit

public extension UIAlertController {
    func addCancelAction() {
        addAction(UIAlertAction(title: "Cancel", style: .cancel))
    }
}
#endif
