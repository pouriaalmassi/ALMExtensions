#if canImport(UIKit)
import UIKit

public protocol Reusable {
    static var reuseIdentifier: String { get }
}

public extension Reusable {
    static var reuseIdentifier: String {
        String(describing: self)
    }
}

public protocol ReusableCell where Self: UITableViewCell {
    static var resuseId: String { get }
}

public extension ReusableCell {
    static var resuseId: String {
        String(describing: self)
    }
}
#endif
