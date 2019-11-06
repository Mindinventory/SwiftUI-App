//
//  ForgotPasswordView.swift
//  DemoSwiftUI
//
//  Created by mac-00018 on 10/10/19.
//  Copyright © 2019 mac-00018. All rights reserved.
//

import SwiftUI

struct ForgotPasswordView: View {
    
    @State var email: String = ""
    @State var showAlert = false
    @State var alertMsg = ""

    var alert: Alert {
        Alert(title: Text(""), message: Text(alertMsg), dismissButton: .default(Text("OK")))
    }
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        
        NavigationView {
            
            ScrollView {
                
                VStack {
                    
                    Spacer(minLength: 80)
                    
                    Text("Write your email address in the text box and we will send you a verification code to reset your password.")
                        .font(.body)
                        .padding()
                        .fixedSize(horizontal: false, vertical: true)
                        .multilineTextAlignment(.center)

                    VStack {
                        
                        HStack {
                            Image("ic_email")
                                .padding(.leading, 20)
                            
                            
                            TextField("Email", text: $email)
                                .frame(height: 40, alignment: .center)
                                .padding(.leading, 10)
                                .padding(.trailing, 10)
                                .font(.system(size: 15, weight: .regular, design: .default))
                                .imageScale(.small)
                                .keyboardType(.emailAddress)
                                .autocapitalization(UITextAutocapitalizationType.none)
                        }
                      
                        seperator()
                    }
                    
                    Spacer(minLength: 20)
                    
                    Button(action: {

                        if self.isValidInputs() {
                            self.presentationMode.wrappedValue.dismiss()
                        }

                    }) {
                        
                        buttonWithBackground(btnText: "SUBMIT")
                    }
                    
                }
            }
        }.alert(isPresented: $showAlert, content: { self.alert })
    }
    
    func isValidInputs() -> Bool {
        
        if self.email == "" {
            self.alertMsg = "Email can't be blank."
            self.showAlert.toggle()
            return false
            
        } else if !self.email.isValidEmail {
            self.alertMsg = "Email is not valid."
            self.showAlert.toggle()
            return false
        }
        
        return true
    }
}

struct ModalView: View {
    
  var body: some View {
    Group {
      Text("Modal view")
      
    }
  }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
        
    }
}



