#if canImport(UIKit)
import UIKit

public extension UIImage {
    class var emptyImage: UIImage? {
        UIImage.image(from: .lightGray)
    }

    class func image(from color: UIColor) -> UIImage? {
        let size = CGSize(width: 1, height: 1)
        // opaque == true to ignore alpha channel. See docs.
        UIGraphicsBeginImageContextWithOptions(size, true, 0)
        color.setFill()
        UIRectFill(CGRect(origin: CGPoint.zero, size: size))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
#endif
