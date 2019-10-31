
//
//  SegmentcontrolView.swift
//  SwiftUIDemo
//
//  Created by mac-00018 on 13/09/19.
//  Copyright © 2019 mac-00018. All rights reserved.
//

import SwiftUI

struct SegmentcontrolView: View {
    
    @State private var selectorIndex = 0
    @State private var numbers = ["One","Two","Three"]
    
    
    @State private var birds = ["Peacock", "Sparrow", "Duck", "Crows", "Pigeons", "Dove"]
    @State private var selectedBird = 0
    
    
      var body: some View {
          VStack {
              // 2
              Picker("Numbers", selection: $selectorIndex) {
                  ForEach(0 ..< numbers.count) { index in
                      Text(self.numbers[index]).tag(index)
                  }
              }.pickerStyle(SegmentedPickerStyle())
            
              // 3.
              Text("Selected value is: \(numbers[selectorIndex])").padding()
            
        
            Picker("Your Fav Bird", selection: $selectedBird) {
                ForEach(0 ..< birds.count) { birdsName in
                    Text(self.birds[birdsName]).tag(birdsName)
                    
                }
            }.pickerStyle(SegmentedPickerStyle())
            
            Text("Your Fav. Bird name is: \(birds[selectedBird])").padding()
        }.padding()
      }
}

struct MaterialSegmentControl : View {
    @State private var MaterialType = 0

    var body: some View {

        NavigationView {

            VStack {
//                SegmentedControl(selection: $MaterialType) {
//                    Text("Style").tag(0)
//                    Text("Text").tag(1)
//                    Text("Arrange").tag(2)
//                }

                if MaterialType == 0 {
                    List {
                        Text("Hi")
                        Text("\(MaterialType)")
                    }
                } else if MaterialType == 1 {
                    List {
                        Text("Beep")
                        Text("\(MaterialType)")
                    }
                } else {
                    List {
                        Text("Boop")
                        Text("\(MaterialType)")
                    }
                }
            }
        }
    }
}

#if DEBUG
struct SegmentcontrolView_Previews: PreviewProvider {
    static var previews: some View {
        SegmentcontrolView()
    }
}
#endif
