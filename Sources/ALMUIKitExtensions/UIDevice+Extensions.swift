#if canImport(UIKit)
import UIKit

public extension UIDevice {
    class var isPhone: Bool {
        UIDevice.current.userInterfaceIdiom == .phone
    }
}
#endif
