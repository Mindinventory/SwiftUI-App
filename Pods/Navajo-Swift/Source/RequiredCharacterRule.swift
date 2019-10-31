//
// RequiredCharacterRule.swift
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

/// RequiredCharacterRulePreset makes initializing NJORequiredCharacterRule easy.
public enum RequiredCharacterRulePreset {
    /// Password should contain at least one lowercase character.
    case lowercaseCharacter
    /// Password should contain at least one uppercase character.
    case uppercaseCharacter
    /// Password should contain at least one decimal digit character.
    case decimalDigitCharacter
    /// Password should contain at least one symbol character.
    case symbolCharacter
}

/// RequiredCharacterRule checks if the password contains at least one required character.
open class RequiredCharacterRule: PasswordRule {

    private var requiredCharacterSetToCompare: CharacterSet?

    open var requiredCharacterSet: CharacterSet? {
        didSet {
            setRequiredCharacterSet(fromCharacterSet: requiredCharacterSet)
        }
    }

    open var preset: RequiredCharacterRulePreset? {
        didSet {
            setRequiredCharacterSet(fromPreset: preset)
        }
    }

    /// Initialize with an CharacterSet object.
    public convenience init(requiredCharacterSet: CharacterSet) {
        self.init()
        self.requiredCharacterSet = requiredCharacterSet
        setRequiredCharacterSet(fromCharacterSet: requiredCharacterSet)
    }

    /// Initialize with an RequiredCharacterRulePreset.
    public convenience init(preset: RequiredCharacterRulePreset) {
        self.init()
        self.preset = preset
        setRequiredCharacterSet(fromPreset: preset)
    }

    private func setRequiredCharacterSet(fromCharacterSet characterSet: CharacterSet?) {
        guard let requiredCharacterSet = requiredCharacterSet else {
            return
        }

        preset = nil
        requiredCharacterSetToCompare = requiredCharacterSet
    }

    private func setRequiredCharacterSet(fromPreset preset: RequiredCharacterRulePreset?) {
        guard let preset = preset else {
            return
        }

        requiredCharacterSet = nil
        switch preset {
        case .lowercaseCharacter:
            requiredCharacterSetToCompare = CharacterSet.lowercaseLetters
        case .uppercaseCharacter:
            requiredCharacterSetToCompare = CharacterSet.uppercaseLetters
        case .decimalDigitCharacter:
            requiredCharacterSetToCompare = CharacterSet.decimalDigits
        case .symbolCharacter:
            var symbolCharacterSet = CharacterSet.symbols
            symbolCharacterSet.formUnion(CharacterSet.punctuationCharacters)
            requiredCharacterSetToCompare = symbolCharacterSet
        }
    }

    /// Evaluate password. Return false if it is passed and true if failed.
    open func evaluate(_ password: String) -> Bool {
        guard let requiredCharacterSetToCompare = requiredCharacterSetToCompare else {
            return false
        }
        return password.rangeOfCharacter(from: requiredCharacterSetToCompare) == nil
    }

    /// Error description.
    /// Localization keys
    /// - Lowercase error "NAVAJO_REQUIRED_CHARACTER_LOWERCASE_ERROR"
    /// - Uppercase error "NAVAJO_REQUIRED_CHARACTER_UPPERCASE_ERROR"
    /// - Decimal digit error "NAVAJO_REQUIRED_CHARACTER_DECIMAL_DIGIT_ERROR"
    /// - Symbol error "NAVAJO_REQUIRED_CHARACTER_SYMBOL_ERROR"
    /// - Default error "NAVAJO_REQUIRED_CHARACTER_REQUIRED_ERROR"
    open var localizedErrorDescription: String {
        guard let preset = preset else {
            return NSLocalizedString("NAVAJO_REQUIRED_CHARACTER_REQUIRED_ERROR", tableName: nil, bundle: Bundle.main, value: "Must include required characters", comment: "Navajo - Required character rule")
        }

        switch preset {
        case .lowercaseCharacter:
            return NSLocalizedString("NAVAJO_REQUIRED_CHARACTER_LOWERCASE_ERROR", tableName: nil, bundle: Bundle.main, value: "Must include lowercase characters", comment: "Navajo - Required lowercase character rule")
        case .uppercaseCharacter:
            return NSLocalizedString("NAVAJO_REQUIRED_CHARACTER_UPPERCASE_ERROR", tableName: nil, bundle: Bundle.main, value: "Must include uppercase characters", comment: "Navajo - Required uppercase character rule")
        case .decimalDigitCharacter:
            return NSLocalizedString("NAVAJO_REQUIRED_CHARACTER_DECIMAL_DIGIT_ERROR", tableName: nil, bundle: Bundle.main, value: "Must include decimal digit characters", comment: "Navajo - Required decimal digit character rule")
        case .symbolCharacter:
            return NSLocalizedString("NAVAJO_REQUIRED_CHARACTER_SYMBOL_ERROR", tableName: nil, bundle: Bundle.main, value: "Must include symbol characters", comment: "Navajo - Required symbol character rule")
        }
    }
}
