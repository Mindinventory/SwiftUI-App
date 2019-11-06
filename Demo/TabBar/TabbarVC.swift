//
//  TabbarVC.swift
//  SwiftUIWorkingDemo
//
//  Created by mac-00015 on 16/10/19.
//  Copyright © 2019 mac-00015. All rights reserved.
//

import SwiftUI

struct TabbarVC: View {
    
    
    
    @State private var selectedView = 0
    
    init() {
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().isTranslucent = true
        UINavigationBar.appearance().tintColor = .black
        UINavigationBar.appearance().backgroundColor = .clear
    }
    
    var body: some View {

        TabView(selection: $selectedView) {
            
            NavigationView {
                HomeVC()
            }
            .tabItem {
                Image.init("ic_home", tintColor: .clear)
                Text("HOME")
            }.tag(0)
            
            NavigationView {
                ListView()
                .navigationBarTitle("", displayMode: .inline)
            }
            .tabItem {
                Image.init("ic_controls", tintColor: .clear)
                Text("CONTROLS")
            }.tag(1)
        }
        .accentColor(lightblueColor)
    }
}

struct TabbarVC_Previews: PreviewProvider {
    static var previews: some View {
        TabbarVC()
    }
}

extension Image {
    init(_ named: String, tintColor: UIColor) {
        let uiImage = UIImage(named: named) ?? UIImage()
        let tintedImage = uiImage.withTintColor(tintColor,
                                                renderingMode: .alwaysTemplate)
        self = Image(uiImage: tintedImage)
    }
}
