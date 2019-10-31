//
//  UserDefault.swift
//  SwiftUIWorkingDemo
//
//  Created by mac-00015 on 17/10/19.
//  Copyright © 2019 mac-00015. All rights reserved.
//

import Foundation

@propertyWrapper
struct UserDefault<T> {
    
    let key: String
    let defaultValue: T
    
    var wrappedValue: T {
        
        get {
            return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
        } set {
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }
}
