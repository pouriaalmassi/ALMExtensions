import XCTest
import Foundation
@testable import ALMFoundationExtensions

final class DateFormatterTests: XCTestCase {
    func testShortDateFormatterUsesShortStyles() {
        XCTAssertEqual(DateFormatter.shortDateTimeFormatter.dateStyle, .short)
        XCTAssertEqual(DateFormatter.shortDateTimeFormatter.timeStyle, .short)
        XCTAssertFalse(DateFormatter.shortDateTimeFormatter.doesRelativeDateFormatting)
    }

    func testMediumDateFormatterUsesMediumAndShortStyles() {
        XCTAssertEqual(DateFormatter.mediumDateFormatter.dateStyle, .medium)
        XCTAssertEqual(DateFormatter.mediumDateFormatter.timeStyle, .short)
        XCTAssertEqual(DateFormatter.mediumDateFormatter.locale.identifier, "en_US_POSIX")
    }
}

final class DateExtensionsTests: XCTestCase {
    func testDaysBetweenCalculatesCorrectDifference() {
        let calendar = Calendar.current
        let date1 = calendar.date(from: DateComponents(year: 2024, month: 1, day: 1))!
        let date2 = calendar.date(from: DateComponents(year: 2024, month: 1, day: 10))!
        
        XCTAssertEqual(Date.daysBetween(earlierDate: date1, and: date2), 9)
        XCTAssertEqual(Date.daysBetween(earlierDate: date2, and: date1), -9)
    }
}

final class NumberFormatterTests: XCTestCase {
    func testCurrencyNumberFormatterSettings() {
        let formatter = NumberFormatter.currencyNumberFormatter
        XCTAssertEqual(formatter.numberStyle, .currency)
        XCTAssertEqual(formatter.minimumFractionDigits, 2)
        XCTAssertEqual(formatter.maximumFractionDigits, 2)
    }
}

final class StringExtensionsTests: XCTestCase {
    func testIsAlphanumeric() {
        XCTAssertTrue("abc123".isAlphanumeric)
        XCTAssertTrue("abc".isAlphanumeric)
        XCTAssertTrue("123".isAlphanumeric)
        XCTAssertTrue("abc 123".isAlphanumeric)
        XCTAssertFalse("".isAlphanumeric)
        XCTAssertFalse("!@#".isAlphanumeric)
    }

    func testIsNumeric() {
        XCTAssertTrue("123".isNumeric)
        XCTAssertFalse("123.45".isNumeric)
        XCTAssertFalse("abc123".isNumeric) // No longer true, must be digits only
        XCTAssertFalse("abc".isNumeric)
        XCTAssertFalse("".isNumeric)
    }

    func testIsLettersOnly() {
        XCTAssertTrue("abc".isLettersOnly)
        XCTAssertTrue("abc!".isLettersOnly)
        XCTAssertFalse("abc123".isLettersOnly)
        XCTAssertFalse("".isLettersOnly)
        XCTAssertFalse("!?.".isLettersOnly)
    }

    func testDeviceLanguage() throws {
        let language = try String.deviceLanguage()
        XCTAssertNotNil(language)
        XCTAssertFalse(language?.isEmpty ?? true)
    }
}
