//
//  ProductListCollVCell.swift
//  SwiftUIWorkingDemo
//
//  Created by mac-00015 on 19/10/19.
//  Copyright © 2019 mac-00015. All rights reserved.
//

import SwiftUI

struct ProductListCollVCell: View {
    
    var product: Product
    
    var body: some View {
        
        NavigationLink(destination: ProductListRedirection(product: product)) {
            
            VStack {
                
                Image(product.imageName)
                    .resizable()
                    .frame(width: (UIScreen.main.bounds.width * 190) / 414, height: (UIScreen.main.bounds.width * 134) / 414)
                    .aspectRatio(contentMode: .fill)
                
                Text("Color Birds")
                    .lineLimit(2)
                    .padding([.leading, .trailing], 5)
                    .foregroundColor(Color("TextColor"))
                    
                
                Spacer()
            }
//            .background(Color.white)
            .border(Color.gray)
            .cornerRadius(10)
            .shadow(radius: 2)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct ProductListCollVCell_Previews: PreviewProvider {
    static var previews: some View {
        ProductListCollVCell(product: Product(name: "First Product", imageName: "bird"))
            .previewLayout(.fixed(width: (UIScreen.main.bounds.width * 200) / 414, height: (UIScreen.main.bounds.width * 200) / 414))
    }
}

struct ProductListRedirection: View {
    
    var product: Product
    
    var body: some View {
        
        switch product.name {
        case "First Product":
            return AnyView(CurrentOrderVC())
        case "Second Product":
            return AnyView(NotificationVC())
        case "Third Product":
            return AnyView(FavouritesVC())
        default:
            return AnyView(Text(product.name))
        }
    }
}
