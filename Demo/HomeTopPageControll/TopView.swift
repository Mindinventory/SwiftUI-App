//
//  OnboardingView.swift
//  App Onboarding
//
//  Created by Andreas Schultz on 10.08.19.
//  Copyright © 2019 Andreas Schultz. All rights reserved.
//

import SwiftUI

struct TopView: View {
    
    var subview = [
        UIHostingController(rootView: HeaderCollVCell(image: "sparrows")),
        UIHostingController(rootView: HeaderCollVCell(image: "pink-birds")),
        UIHostingController(rootView: HeaderCollVCell(image: "white-ducks"))
    ]
    
    @State var currentPage = 0
    
    var body: some View {
        
        VStack {
            
            PageVC(currentPageIndex: $currentPage,viewControllers: subview)
                .frame(height: (UIScreen.main.bounds.width * 250) / 414)
            
            PageControl(numberOfPages: subview.count, currentPageIndex: $currentPage)
        }
    }
}

#if DEBUG
struct TopView_Previews: PreviewProvider {
    static var previews: some View {
        TopView()
    }
}
#endif
