//
// DictionaryWordRule.swift
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

#if os(OSX)
    import Cocoa
#else
    import UIKit
#endif

/// DictionaryWordRule checks if the password can be found on the OSX or iOS dictionary.
open class DictionaryWordRule: PasswordRule {

    private let nonLowercaseCharacterSet = CharacterSet.lowercaseLetters.inverted

    /// Evaluate password. Return false if it is passed and true if failed.
    open func evaluate(_ password: String) -> Bool {
        #if os(OSX)
            return DCSGetTermRangeInString(nil, password as CFString, 0).location != kCFNotFound
        #else
            return UIReferenceLibraryViewController.dictionaryHasDefinition(forTerm: password.lowercased().trimmingCharacters(in: nonLowercaseCharacterSet))
        #endif
    }

    /// Error description.
    /// Localization Key - "NAVAJO_DICTIONARYWORD_ERROR"
    open var localizedErrorDescription: String {
        return NSLocalizedString("NAVAJO_DICTIONARYWORD_ERROR", tableName: nil, bundle: Bundle.main, value: "Must not be dictionary word", comment: "Navajo - Dictionary word rule")
    }
}
