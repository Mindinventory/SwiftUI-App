//
//  ListView.swift
//  DemoSwiftUI
//
//  Created by mac-00018 on 11/10/19.
//  Copyright © 2019 mac-00018. All rights reserved.
//

import SwiftUI

struct ListData {
    var title: String = ""
}

//MARK:-
//MARK:- List Data
struct ListView: View {
    
    var data = [
        ListData(title: "Segment Control"),
        ListData(title: "Combine Framework Demo"),
        ListData(title: "Picker"),
    ]
    @EnvironmentObject var settings: UserSettings
    
    var body: some View {
        
        VStack {
            
            List {
                
                ForEach(data, id:\.title) { list in
                    NavigationLink(destination: RedirectionFromList(data: list)) {
                        RowData(list: list)
                    }
                }
            }
            .padding(.top)
        .listStyle(GroupedListStyle())
            
            
            Button(action: {
                    // For use with property wrapper
                    UserDefaults.standard.set(false, forKey: "Loggedin")
                    UserDefaults.standard.synchronize()
                    self.settings.loggedIn = false
                    // ==========
                    
                    // For use with property wrapper
                    //                self.dataStore.loggedIn = false
                    // ==========
            }) {
                buttonWithBackground(btnText: "LOGOUT")
            }.padding(.bottom)
            
        }
    }
    
    
    func adjustUITextViewHeight(arg : UIView) {
        arg.translatesAutoresizingMaskIntoConstraints = true
        arg.sizeToFit()
//        arg.isScrollEnabled = false
    }
        
}


//MARK:-
//MARK:- List Row Data
struct RowData: View {
    
    var list: ListData
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            HStack(alignment: .top) {
                
                VStack(alignment: .leading) {
                    
                    Text(list.title)
                        .font(.system(Font.TextStyle.body, design: Font.Design.monospaced))
                        .foregroundColor(Color.blue)
                    
                    VStack {
                        DetailsView(listdata: list)
                    }
                }
            }
        }
    }
}

//MARK:-
//AMRK:- Detail View
struct DetailsView: View {
    var listdata: ListData
    var uiControls: [Any] = [LoginView(), ForgotPasswordView()]

    var body: some View {
        VStack {
//            Text(listdata.title)
//                .font(.title)
            
            ForEach(0..<uiControls.count) { list in
                self.buildView(types: self.uiControls, index: list)
                
            }
        }
//        .navigationBarTitle(Text(listdata.title), displayMode: .inline)
    }
    
    func buildView(types: [Any], index: Int) -> AnyView {
        switch types[index].self {
        case is LoginView.Type: return AnyView( LoginView() )
        case is ForgotPasswordView.Type: return AnyView( ForgotPasswordView() )
        default: return AnyView(EmptyView())
        }
    }
}

struct RedirectionFromList: View {
    
    var data: ListData
    
    var body: some View {
        switch data.title {
        case "Segment Control":
            return AnyView(SegmentcontrolView())
        case "Combine Framework Demo":
            return AnyView(SignupVC())
        case "Picker":
            return AnyView(PickerView())
        default:
            return AnyView(SegmentcontrolView())
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
