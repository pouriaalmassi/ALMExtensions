import Testing
import Foundation
@testable import ALMFoundationExtensions

@Suite struct DateFormatterTests {
    @Test func shortDateFormatterUsesShortStyles() {
        #expect(DateFormatter.shortDateTimeFormatter.dateStyle == .short)
        #expect(DateFormatter.shortDateTimeFormatter.timeStyle == .short)
        #expect(!DateFormatter.shortDateTimeFormatter.doesRelativeDateFormatting)
    }

    @Test func mediumDateFormatterUsesMediumAndShortStyles() {
        #expect(DateFormatter.mediumDateFormatter.dateStyle == .medium)
        #expect(DateFormatter.mediumDateFormatter.timeStyle == .short)
        #expect(DateFormatter.mediumDateFormatter.locale.identifier == "en_US_POSIX")
    }
}

@Suite struct DateExtensionsTests {
    @Test func daysBetweenCalculatesCorrectDifference() {
        let calendar = Calendar.current
        let date1 = calendar.date(from: DateComponents(year: 2024, month: 1, day: 1))!
        let date2 = calendar.date(from: DateComponents(year: 2024, month: 1, day: 10))!
        
        #expect(Date.daysBetween(earlierDate: date1, and: date2) == 9)
        #expect(Date.daysBetween(earlierDate: date2, and: date1) == -9)
    }
}

@Suite struct NumberFormatterTests {
    @Test func currencyNumberFormatterSettings() {
        let formatter = NumberFormatter.currencyNumberFormatter
        #expect(formatter.numberStyle == .currency)
        #expect(formatter.minimumFractionDigits == 2)
        #expect(formatter.maximumFractionDigits == 2)
    }
}

@Suite struct StringExtensionsTests {
    @Test func isAlphanumeric() {
        #expect("abc123".isAlphanumeric)
        #expect("abc".isAlphanumeric)
        #expect("123".isAlphanumeric)
        #expect(!"abc 123".isAlphanumeric)
        #expect(!"".isAlphanumeric)
        #expect(!"!@#".isAlphanumeric)
    }

    @Test func isNumeric() {
        #expect("123".isNumeric)
        #expect(!"123.45".isNumeric)
        #expect(!"abc123".isNumeric)
        #expect(!"abc".isNumeric)
        #expect(!"".isNumeric)
    }

    @Test func isLettersOnly() {
        #expect("abc".isLettersOnly)
        #expect(!"abc!".isLettersOnly)
        #expect(!"abc123".isLettersOnly)
        #expect(!"".isLettersOnly)
        #expect(!"!?.".isLettersOnly)
    }

    @Test func deviceLanguage() throws {
        let language = try String.deviceLanguage()
        #expect(language != nil)
        #expect(language?.isEmpty == false)
    }
}

@Suite struct URLRequestExtensionsTests {
    @Test func cURLDescriptionWithGetRequest() {
        let url = URL(string: "https://api.example.com/v1/users")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        let curl = request.cURLDescription
        #expect(curl.contains("curl -i"))
        #expect(curl.contains("-X GET"))
        #expect(curl.contains("-H \"Accept: application/json\""))
        #expect(curl.contains("\"https://api.example.com/v1/users\""))
    }
    
    @Test func cURLDescriptionRedactsAuthorizationHeader() {
        let url = URL(string: "https://api.example.com/v1/users")!
        var request = URLRequest(url: url)
        request.setValue("Bearer secret_token_123", forHTTPHeaderField: "Authorization")
        
        let curl = request.cURLDescription
        #expect(curl.contains("-H \"Authorization: Bearer [REDACTED]\""))
        #expect(!curl.contains("secret_token_123"))
    }
    
    @Test func cURLDescriptionIncludesHttpBody() {
        let url = URL(string: "https://api.example.com/v1/users")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let json = "{\"name\":\"John Doe\"}"
        request.httpBody = json.data(using: .utf8)
        
        let curl = request.cURLDescription
        #expect(curl.contains("-d \"{\\\"name\\\":\\\"John Doe\\\"}\""))
    }
}

@Suite struct DataExtensionsTests {
    @Test func rawJSONStringWithValidJSON() {
        let jsonDict = ["name": "Alice", "age": 30] as [String : Any]
        let data = try! JSONSerialization.data(withJSONObject: jsonDict, options: .prettyPrinted)
        
        let rawJSON = data.rawJSONString
        // It should be minified, so no newlines or indentation spaces
        #expect(!rawJSON.contains("\n"))
        #expect(rawJSON.contains("\"name\":\"Alice\"") || rawJSON.contains("\"age\":30"))
    }
    
    @Test func rawJSONStringWithInvalidJSONFallback() {
        let rawText = "Hello World! This is not JSON."
        let data = rawText.data(using: .utf8)!
        
        let rawJSON = data.rawJSONString
        #expect(rawJSON == rawText)
    }
}
