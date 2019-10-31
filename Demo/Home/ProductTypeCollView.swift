//
//  ProductTypeCollView.swift
//  SwiftUIWorkingDemo
//
//  Created by mac-00015 on 19/10/19.
//  Copyright © 2019 mac-00015. All rights reserved.
//

import SwiftUI

struct ProductTypeCollView: View {
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            
            HStack {
                
                ForEach((1...10).reversed(), id: \.self) { _ in
                    ProductTypeCollVCell()
                }
            }
        }
    }
}

struct ProductTypeCollView_Previews: PreviewProvider {
    static var previews: some View {
        ProductTypeCollView()
    }
}
