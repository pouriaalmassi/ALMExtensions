import Testing
import Foundation
@testable import ALMExtensions

@Test func shortDateFormatterUsesShortDateStyle() {
    #expect(DateFormatter.shortDateTimeFormatter.dateStyle == .short)
}

@Test func shortDateFormatterUsesShortTimeStyle() {
    #expect(DateFormatter.shortDateTimeFormatter.timeStyle == .short)
}

@Test func shortDateFormatterDoesNotUseRelativeDateFormatting() {
    #expect(DateFormatter.shortDateTimeFormatter.doesRelativeDateFormatting == false)
}

// I used contains checks instead of an exact string match to avoid a tricky Unicode issue
// Apple uses a narrow no-break space (U+202F) before "PM" which is visually indistinguishable from a regular space.
@Test func shortDateFormatterFormatsISO8601String() throws {
    let isoFormatter = ISO8601DateFormatter()
    let date = try #require(isoFormatter.date(from: "2025-12-25T14:30:00Z"))

    let formatter = DateFormatter.shortDateTimeFormatter
    formatter.locale = Locale(identifier: "en_US")
    formatter.timeZone = TimeZone(identifier: "UTC")

    let result = formatter.string(from: date)
    #expect(result.contains("12/25/25"))
    #expect(result.contains("2:30"))
    #expect(result.contains("PM"))
}
