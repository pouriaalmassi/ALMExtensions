#if canImport(UIKit)
import UIKit

public extension UICollectionView {
    func registerClassForCell<T: Reusable>(_ cell: T.Type) {
        register(T.self, forCellWithReuseIdentifier: T.reuseIdentifier)
    }

    func registerClassForHeader<T: Reusable>(_ cell: T.Type) {
        register(T.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: T.reuseIdentifier)
    }

    func registerClassForFooter<T: Reusable>(_ cell: T.Type) {
        register(T.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: T.reuseIdentifier)
    }

    func registerNibForCell<T: Reusable>(_ cell: T.Type) {
        register(UINib(nibName: T.reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: T.reuseIdentifier)
    }

    func registerNibForHeader<T: Reusable>(_ cell: T.Type) {
        register(UINib(nibName: T.reuseIdentifier, bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: T.reuseIdentifier)
    }

    func registerNibForFooter<T: Reusable>(_ cell: T.Type) {
        register(UINib(nibName: T.reuseIdentifier, bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: T.reuseIdentifier)
    }
}
#endif
