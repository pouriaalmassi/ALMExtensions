#if canImport(UIKit)
import UIKit

public extension UIView {
    func pinToParent(parent: UIView, padding: CGFloat = 0.0) {
        parent.addSubview(self)
        translatesAutoresizingMaskIntoConstraints = false
        leftAnchor.constraint(equalTo: parent.leftAnchor, constant: padding).isActive = true
        rightAnchor.constraint(equalTo: parent.rightAnchor, constant: -padding).isActive = true
        topAnchor.constraint(equalTo: parent.topAnchor, constant: padding).isActive = true
        bottomAnchor.constraint(equalTo: parent.bottomAnchor, constant: -padding).isActive = true
    }

    func pinToBottom(parent: UIView, height: CGFloat = 1.0, padding: CGFloat = 0.0) {
        parent.addSubview(self)
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
        leftAnchor.constraint(equalTo: parent.leftAnchor, constant: padding).isActive = true
        rightAnchor.constraint(equalTo: parent.rightAnchor, constant: -padding).isActive = true
        bottomAnchor.constraint(equalTo: parent.bottomAnchor, constant: -padding).isActive = true
    }

    func pinToRight(parent: UIView, width: CGFloat = 1.0, padding: CGFloat = 0.0) {
        parent.addSubview(self)
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: width).isActive = true
        topAnchor.constraint(equalTo: parent.topAnchor, constant: padding).isActive = true
        rightAnchor.constraint(equalTo: parent.rightAnchor, constant: -padding).isActive = true
        bottomAnchor.constraint(equalTo: parent.bottomAnchor, constant: -padding).isActive = true
    }
}
#endif
