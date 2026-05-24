#if canImport(UIKit)
import UIKit

public extension UITableView {
    func deselectRow() {
        guard let indexPath = self.indexPathForSelectedRow else { return }
        self.deselectRow(at: indexPath, animated: true)
    }

    func registerClassForCell<T: Reusable>(_ cellType: T.Type) {
        register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
    }

    func registerClassForHeaderFooter<T: Reusable>(_ cellType: T.Type) {
        register(T.self, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
    }

    func registerNibForCell<T: Reusable>(_ cellType: T.Type) {
        register(UINib(nibName: T.reuseIdentifier, bundle: nil), forCellReuseIdentifier: T.reuseIdentifier)
    }

    func registerNibForHeaderFooter<T: Reusable>(_ cellType: T.Type) {
        register(UINib(nibName: T.reuseIdentifier, bundle: nil), forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
    }
}
#endif
