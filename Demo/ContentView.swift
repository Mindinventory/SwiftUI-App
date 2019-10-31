//
//  ContentView.swift
//  Demo
//
//  Created by mac-00018 on 21/10/19.
//  Copyright © 2019 mac-00018. All rights reserved.
//

import SwiftUI

//MARK:-
//MARK:- Color

let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)
let lightGreenColor = Color(red: 21.0/255.0, green: 183.0/255.0, blue: 177.0/255.0, opacity: 1.0)
let lightblueColor = Color(red: 85.0/255.0, green: 84.0/255.0, blue: 166.0/255.0, opacity: 1.0)
struct ContentView: View {
    @State var alertMsg = ""
    
    var alert: Alert {
           Alert(title: Text(""), message: Text(alertMsg), dismissButton: .default(Text("OK")))
       }
    
    var body: some View {
        Text("Hello")
    }
}

struct NavigationConfigurator: UIViewControllerRepresentable {
    
    var configure: (UINavigationController) -> Void = { _ in }

    func makeUIViewController(context: Context) -> UIViewController {
        
        UIViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
        if let nc = uiViewController.navigationController {
            self.configure(nc)
        }
    }
}

//MARK:-
//MARK:- Rounded Image
struct RoundedImage: View {

    var body: some View {
        
        Image("logo")
           .resizable()
           .aspectRatio(contentMode: .fill)
           .frame(width: 150, height: 150)
           .clipped()
           .cornerRadius(150)
           .padding(.bottom, 40)
        
    }

}

//MARK:-
//MARK:- Textfields
struct textFieldWithSeperator: View {
    
    var placeholder: String
    var image: String
//    var text : String
   
    @State var username: String = ""
    @State var name = ""
    @Environment(\.editMode) var mode
    
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
                //                .textFieldStyle(RoundedBorderTextFieldStyle())
                
            }
            seperator()
        }
        
    }
}



//MARK:-
//MARK:- Seperator (Bottom line view)
struct seperator: View {
    
    var body: some View {
    
        VStack {
            
            Divider().background(lightGreyColor)
            
        }.padding()
            .frame(height: 1, alignment: .center)
    }
}

struct buttons: View {
    
    var btnText: String
    
    var body: some View {
         
        Text(btnText)
            .font(.body)
            .foregroundColor(.black)
            //                 .frame(width: 150, height: 40)
            .padding()
    }
}

//MARK:-
//MARK:- Button with background & shaadow
struct buttonWithBackground: View {
    
    var btnText: String
    
    var body: some View {
        
        HStack {
//            Spacer()
            Text(btnText)
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(width: 140, height: 50)
                .background(lightblueColor)
                .clipped()
                .cornerRadius(5.0)
                .shadow(color: lightblueColor, radius: 5, x: 0, y: 5)
            
//            Spacer()
        }
    }
}


//MARK:-
//MARK:- Alert View
struct alertView: View {
    
    
    @State var alertMsg = ""
    
    var alert: Alert {
        Alert(title: Text(""), message: Text(alertMsg), dismissButton: .default(Text("OK")))
    }
    
    var body: some View {
        Text("Alert")
    }
    
}

//MARK: - Date Picker View
struct DatePickerView: View {
    
    var dateFormatter: DateFormatter {
           let formatter = DateFormatter()
           formatter.dateStyle = .long
           return formatter
    }
    
    @State private var birthDate = Date()
    
    var body: some View {
        
        VStack {
            DatePicker(selection: $birthDate, in: ...Date(), displayedComponents: .date) {
                Text("Select a date")
            }
            
            Text("Date is \(birthDate, formatter: dateFormatter)")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
