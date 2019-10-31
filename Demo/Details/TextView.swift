//
//  TextView.swift
//  SwiftUIDemo
//
//  Created by mac-00018 on 16/09/19.
//  Copyright © 2019 mac-00018. All rights reserved.
//

import SwiftUI

struct TextView: View {
    @State private var slider: Float = 100.0
    
    var body: some View {
    
        VStack {
            
//            VStack {
//                GeometryReader { geometry in
//                    HStack(alignment: .center, spacing: 0) {
//                        ForEach(0..<7) { _ in
//                            Text("Mon").frame(width: geometry.size.width / 7, height: 30).border(Color.blue)
//                        }
//                    }
//                }.frame(width: CGFloat(slider), height: 40)
//                Text("\(slider)")
//                Slider(value: self.$slider, from: 100.0, through: 400.0, by: 1.0)
////                Slider(value: self.$slider, in: 100.0, step: 1.0, onEditingChanged: true)
//                Spacer()
//            }
        
            ScrollView {
                VStack {
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
            
            Text("Hello World!")
                .fixedSize(horizontal: false, vertical: true)
            
            Text ("Dynamic Text")
                .font(.largeTitle)
                .fontWeight(.bold)
            Text ("Hello!!, How are you?")
                .kerning(10)
            
            Text ("Text for Color Expample")
                .foregroundColor(.white)
                .background(Color.black)
            
            Text("Text Style")
                .bold()
                .italic()
            
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
                //            .lineLimit(2)
                .lineLimit(nil)
                .lineSpacing(10)
                .multilineTextAlignment(.center)
            

            
        }
    }
}

#if DEBUG
struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        TextView()
    }
}
#endif
