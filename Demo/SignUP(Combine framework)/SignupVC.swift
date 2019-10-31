//
//  SignupVC.swift
//  SwiftUIWorkingDemo
//
//  Created by mac-00015 on 22/10/19.
//  Copyright © 2019 mac-00015. All rights reserved.
//

import SwiftUI

struct SignupVC: View {
    
    @ObservedObject private var userViewModel = UserViewModel()
    @State var presentAlert = false
    
    var body: some View {
        
        Form {
            
            Section(footer: Text(userViewModel.usernameMessage).foregroundColor(.red)) {
                TextField("Username", text: $userViewModel.userName)
                    .autocapitalization(.none)
            }
            
            Section(footer: Text(userViewModel.passwordMessage).foregroundColor(.red)) {
                
                SecureField("Password", text: $userViewModel.password)
                SecureField("Confirm Password", text: $userViewModel.confirmPassword)
            }
            
            Section {
                
                Button(action: {
                    self.signUp()
                }) {
                    Text("Sign up")
                }
                .disabled(!userViewModel.isValid)
            }
        }
        .sheet(isPresented: $presentAlert) {
            WelcomeView()
        }
    }
    
    func signUp() {
        self.presentAlert = true
    }
}

struct SignupVC_Previews: PreviewProvider {
    static var previews: some View {
        SignupVC()
    }
}

struct WelcomeView: View {
    var body: some View {
        Text("Welcome! Great to have you on board!")
    }
}

