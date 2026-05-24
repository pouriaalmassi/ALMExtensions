#if canImport(UIKit)
import UIKit

// Credit: Daniele Margutti / http://danielemargutti.com/2017/10/31/animate-uiwindows-rootviewcontroller-transitions
public extension UIWindow {
    struct TransitionOptions {
        public enum Curve {
            case linear, easeIn, easeOut, easeInOut

            internal var timingFunction: CAMediaTimingFunction {
                let key: CAMediaTimingFunctionName!
                switch self {
                case .linear: key = CAMediaTimingFunctionName.linear
                case .easeIn: key = CAMediaTimingFunctionName.easeIn
                case .easeOut: key = CAMediaTimingFunctionName.easeOut
                case .easeInOut: key = CAMediaTimingFunctionName.easeInEaseOut
                }
                return CAMediaTimingFunction(name: key)
            }
        }

        public enum Direction {
            case fade, toTop, toBottom, toLeft, toRight

            internal func transition() -> CATransition {
                let transition = CATransition()
                transition.type = .push
                switch self {
                case .fade:
                    transition.type = .fade
                    transition.subtype = nil
                case .toLeft: transition.subtype = CATransitionSubtype.fromLeft
                case .toRight: transition.subtype = CATransitionSubtype.fromRight
                case .toTop: transition.subtype = CATransitionSubtype.fromTop
                case .toBottom: transition.subtype = CATransitionSubtype.fromBottom
                }
                return transition
            }
        }

        public enum Background {
            case solidColor(_: UIColor)
            case customView(_: UIView)
        }

        public var duration: TimeInterval = 0.3
        public var direction: TransitionOptions.Direction = .toRight
        public var style: TransitionOptions.Curve = .linear
        public var background: TransitionOptions.Background? = nil

        public init(direction: TransitionOptions.Direction = .toRight, style: TransitionOptions.Curve = .linear) {
            self.direction = direction
            self.style = style
        }

        public init() {}

        internal var animation: CATransition {
            let transition = direction.transition()
            transition.duration = duration
            transition.timingFunction = style.timingFunction
            return transition
        }
    }

    func setRootViewController(_ controller: UIViewController, options: TransitionOptions = TransitionOptions()) {
        var transitionWindow: UIWindow? = nil
        if let background = options.background {
            transitionWindow = UIWindow(frame: UIScreen.main.bounds)
            switch background {
            case .solidColor(let color):
                transitionWindow?.backgroundColor = color
            case .customView(let view):
                if let tw = transitionWindow {
                    transitionWindow?.rootViewController = UIViewController.newController(withView: view, frame: tw.bounds)
                }
            }
            transitionWindow?.makeKeyAndVisible()
        }

        // animation
        self.layer.add(options.animation, forKey: kCATransition)
        self.rootViewController = controller
        self.makeKeyAndVisible()

        if let aTransitionWindow = transitionWindow {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1 + options.duration) {
                aTransitionWindow.removeFromSuperview()
            }
        }
    }
}
#endif
