//
//  DateFormatter.swift
//  ALMExtensions
//
//  Created by Pouria Almassi on 2025-12-13.
//

import Foundation

public extension DateFormatter {
    static let shortDateTimeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        formatter.locale = Locale(identifier: "en_US")
        formatter.doesRelativeDateFormatting = false
        return formatter
    }()
}
