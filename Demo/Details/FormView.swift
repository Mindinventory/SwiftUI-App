//
//  FormView.swift
//  SwiftUIDemo
//
//  Created by mac-00018 on 01/10/19.
//  Copyright © 2019 mac-00018. All rights reserved.
//

import SwiftUI

enum PasswordLevel: Int {
    case none = 0
    case weak = 1
    case ok = 2
    case strong = 3
}

//struct FormView: View {
//
//    @State private var name: String = ""
//    @State private var email: String = ""
//    @State private var password: String = ""
//
//    var body: some View {
//        NavigationView {
//            Form {
//                Section(header: Text("Your Info")) {
//                    tempTextField(placeholder: "Name", image: "ic_email", username: name)
//                    tempTextField(placeholder: "Email", image: "ic_email", username: email)
//                }
//
//                Section(header: Text("Password")) {
////                     TextField("Password", text: Binding<String>.constant(""))
//                    securetextField(placeholder: "Password", image: "ic_password", password: password)
//                }
//
//                Section {
//                    Button(action: {
//                        print("register account")
//                    }) {
//                        Text("OK")
//                    }
//                }
//            }.navigationBarTitle("Form")
//        }
//    }
//}
//struct FormView: View {
//    @State private var enableLogging = false
//
//    @State private var selectedColor = 0
//    @State private var colors = ["Red", "Green", "Blue"]
//
//    var body: some View {
//        NavigationView {
//            Form {
//                Picker(selection: $selectedColor, label: Text("Select a color")) {
//                    ForEach(0 ..< colors.count) {
//                        Text(self.colors[$0]).tag($0)
//                    }
//                }.pickerStyle(SegmentedPickerStyle())
//
//                Toggle(isOn: $enableLogging) {
//                    Text("Enable Logging")
//                }
//
//                Button(action: {
//                // activate theme!
//                }) {
//                    Text("Save changes")
//                }
//            }.navigationBarTitle("Settings")
//        }
//    }
//}

struct FormView: View {
    @State private var enableLogging = false

    @State private var selectedColor = 0
    @State private var colors = ["Red", "Green", "Blue"]

    var body: some View {
        NavigationView {
            Form {
                Section(footer: Text("Note: Enabling logging may slow down the app")) {
                    Picker(selection: $selectedColor, label: Text("Select a color")) {
                        ForEach(0 ..< colors.count) {
                            Text(self.colors[$0]).tag($0)
                        }
                    }.pickerStyle(SegmentedPickerStyle())

                    Toggle(isOn: $enableLogging) {
                        Text("Enable Logging")
                    }
                }

                Section {
                    Button(action: {
                    // activate theme!
                    }) {
                        Text("Save changes")
                    }
                }
            }.navigationBarTitle("Settings")
        }
    }
}
struct tempTextField: View {
    
    var placeholder: String
    var image: String
   
    @State var username: String = ""
    
    @Environment(\.presentationMode) var mode
    @State var name = ""
    
    var body: some View {
        
        VStack {
            
            HStack {
                Image(image)
                    .padding(.leading, 20)
                TextField(placeholder, text: $username)
                    .frame(height: 40, alignment: .center)
                    .padding(.leading, 10)
                    .padding(.trailing, 10)
                    .font(.system(size: 15, weight: .regular, design: .default))
                    .imageScale(.small)
//                    .disabled(mode?.wrappedValue == .inactive)
//                                .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            
//            seperator()
            
        }
        
    }
}

struct securetextField: View {
    
    var placeholder: String
    var image: String
    
    @State var password: String = ""
    
    var body: some View {
        
        VStack {
            
            HStack {
                Image(image)
                    .padding(.leading, 20)
                
                SecureField(placeholder, text: $password)
                    .frame(height: 40, alignment: .center)
                    .padding(.leading, 10)
                    .padding(.trailing, 10)
                    .font(.system(size: 15, weight: .regular, design: .default))
                    .imageScale(.small)
            }
//            seperator()
            
        }
        
    }
}

struct secureLevelView: View {
    var level: PasswordLevel
    var body: some View {
        
        HStack {
            RoundedRectangle(cornerRadius: 8).foregroundColor(getColors()[0]).frame(height: 10)
        }
    }
    
    func getColors() -> [Color] {
        switch self.level {
        case .none:
            return [.clear, .clear, .clear]
        case .weak:
            return [.red, .clear, .clear]
        case .ok:
            return [.red, .orange, .clear]
        case .strong:
            return [.red, .orange, .green]
        }
    }
}

//class PasswordChecker: BindableObject {
//    let didChange = PassthroughSubject<PasswordChecker, Never>()
//    var password: String = "" {
//        didSet {
//            self.checkForPassword(password: self.password)
//        }
//    }
//
//    var level: PasswordLevel = .none {
//        didSet {
//            self.didChange.send(self)
//        }
//    }
//
//    func checkForPassword(password: String) {
//        if password.count == 0 {
//            self.level = .none
//        } else if password.count < 2 {
//            self.level = .weak
//        } else if password.count < 6 {
//            self.level = .ok
//        } else {
//            self.level = .strong
//        }
//    }
//}

#if DEBUG
struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView()
    }
}
#endif
