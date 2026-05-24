import Foundation

public extension String {
    enum StringError: Error {
        case missingPreferredDeviceLanguage
    }

    static var versionString: String {
        Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
    }

    static var buildString: String {
        Bundle.main.infoDictionary?["CFBundleVersion"] as! String
    }

    static func deviceLanguage() throws -> String? {
        guard let first = Locale.preferredLanguages.first else {
            throw StringError.missingPreferredDeviceLanguage
        }
        return first
    }

    var isAlphanumeric: Bool {
        !isEmpty && allSatisfy { $0.isLetter || $0.isNumber }
    }

    var isNumeric: Bool {
        !isEmpty && allSatisfy { $0.isNumber }
    }

    // "!?.".isLettersOnly // false
    // "a12".isLettersOnly // false
    // "abc".isLettersOnly // true
    var isLettersOnly: Bool {
        !isEmpty && allSatisfy { $0.isLetter }
    }
}
