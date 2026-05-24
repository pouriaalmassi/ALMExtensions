import Foundation

public extension Date {
    static func daysBetween(earlierDate: Date, and laterDate: Date) -> Int {
        Calendar(identifier: Calendar.Identifier.gregorian).dateComponents([.day], from: earlierDate, to: laterDate).day ?? 0
    }
}
