//
// RegularExpressionRule.swift
// Navajo
//
// Copyright (c) 2015-2017 Jason Nam (http://jasonnam.com)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//

import Foundation

/// RegularExpressionRule checks password with a NSRegularExpression object.
open class RegularExpressionRule: PasswordRule {

    open var regularExpression: NSRegularExpression?

    /// Initialize with an NSRegularExpression object.
    public convenience init(regularExpression: NSRegularExpression) {
        self.init()
        self.regularExpression = regularExpression
    }

    /// Evaluate password. Return false if it is passed and true if failed.
    open func evaluate(_ password: String) -> Bool {
        guard let regularExpression = regularExpression else {
            return false
        }

        return regularExpression.numberOfMatches(in: password, options: [], range: NSMakeRange(0, password.count)) > 0
    }

    /// Error description.
    /// Localization Key - "NAVAJO_REGEX_ERROR"
    open var localizedErrorDescription: String {
        return NSLocalizedString("NAVAJO_REGEX_ERROR", tableName: nil, bundle: Bundle.main, value: "Must not match regular expression", comment: "Navajo - Regex rule")
    }
}
