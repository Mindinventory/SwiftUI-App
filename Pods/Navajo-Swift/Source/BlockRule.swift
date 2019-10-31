//
// BlockRule.swift
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

/// BlockRule checks password with a block which gets a string and returns a bool value.
open class BlockRule: PasswordRule {

    open var evaluation: ((String) -> Bool)?

    /// Initialize with a Block.
    public convenience init(evaluation: @escaping (String) -> Bool) {
        self.init()
        self.evaluation = evaluation
    }

    /// Evaluate password. Return false if it is passed and true if failed.
    open func evaluate(_ password: String) -> Bool {
        guard let evaluation = evaluation else {
            return false
        }

        return evaluation(password)
    }

    /// Error description.
    /// Localization Key - "NAVAJO_BLOCK_ERROR"
    open var localizedErrorDescription: String {
        return NSLocalizedString("NAVAJO_BLOCK_ERROR", tableName: nil, bundle: Bundle.main, value: "Must not satisfy precondition", comment: "Navajo - Block rule")
    }
}
