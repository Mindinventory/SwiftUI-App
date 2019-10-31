//
//  CollectionView.swift
//  DemoSwiftUI
//
//  Created by mac-00018 on 11/10/19.
//  Copyright © 2019 mac-00018. All rights reserved.
//

import SwiftUI

struct CollectionView: View {
    
    @State var arrData: [String] = []
    @State var isOpen: Bool = false
    
    var body: some View {
        
        CollectionUI(arrData: self.$arrData)
              .edgesIgnoringSafeArea(.all)
        
    }
    
    func openMenu() {
        self.isOpen.toggle()
    }
    
}

struct CollectionView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionView()
    }
}
