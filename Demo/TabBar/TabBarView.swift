//
//  TabBarView.swift
//  SwiftUIDemo
//
//  Created by mac-00018 on 16/09/19.
//  Copyright © 2019 mac-00018. All rights reserved.
//

import SwiftUI

struct TabBarView: View {
    
    var body: some View {
        
        TabView {
            
            ListView()
                .tabItem ( { VStack {
                    Image("ic_email")
                    Text("List View")
                    }
                }).tag(0)
            
            CollectionView()
                .tabItem ( { VStack {
                    Image("ic_email")
                    Text("Collection View")
                    }
                }).tag(1)
        }
    }
    
}

#if DEBUG
struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
#endif
