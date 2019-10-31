//
//  HomeVC.swift
//  SwiftUIWorkingDemo
//
//  Created by mac-00015 on 16/10/19.
//  Copyright © 2019 mac-00015. All rights reserved.
//

import SwiftUI

struct Product : Identifiable {
    var id = UUID()
    var name: String
    var imageName: String
}

let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
let statusbarHeight = window?.windowScene?.statusBarManager?.statusBarFrame.size.height ?? 0

struct HomeVC: View {
    
    init() {
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
    }
    
    let arrProduct = [
        Product(name: "First Product", imageName: "prrotes"),
        Product(name: "Second Product", imageName: "pink-birds"),
        Product(name: "Third Product", imageName: "sparrows"),
        Product(name: "Fourth Product", imageName: "white-bird"),
        Product(name: "Fifth Product", imageName: "white-ducks"),
        Product(name: "Sixth Product", imageName: "bird"),
        Product(name: "Seventh Product", imageName: "prrotes"),
        Product(name: "Eight Product", imageName: "prrotes"),
        Product(name: "Nineth Product", imageName: "bird")
    ]
    
    var body: some View {
        
        List {
            
//            HeaderCollView()
            TopView()
            
            VStack(alignment: .leading) {
                Group {
                    Text("Shop by Category")
                    
                    ProductTypeCollView()
                }
            }
            
            ProductListCollView(arrProduct: arrProduct)
                .frame(height: ((((UIScreen.main.bounds.width * 210) / 414) * (CGFloat(self.arrProduct.count % 2 == 0 ? Int(self.arrProduct.count / 2) : Int(self.arrProduct.count / 2) + 1))) + CGFloat(Int(self.arrProduct.count / 2) * 20)))
        }
        .edgesIgnoringSafeArea(.top)
        .listStyle(GroupedListStyle())
    }
}

struct HomeVC_Previews: PreviewProvider {
    static var previews: some View {
        HomeVC()
    }
}
