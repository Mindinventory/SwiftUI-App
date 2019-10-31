//
//  CollectionUI.swift
//  CollectionViewSwiftUI
//
//  Created by mac-00013 on 05/10/19.
//  Copyright © 2019 swift. All rights reserved.
//

import SwiftUI

struct CollectionUI: UIViewRepresentable {
    
    var arrData: Binding<[String]>
    
    func makeCoordinator() -> CollectionUI.Coordinator {
        Coordinator(data: [])
    }
    
    class Coordinator: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
        var data: [String] = []

        init(data: [String]) {

            for index in (0...10) {
                self.data.append("\(index)")
            }
        }

        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            10
        }

        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as? CustomCell {
                cell.lblNum.text = "\(indexPath.item)"
                return cell
            }
            
            return UICollectionViewCell()
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            CGSize(width: collectionView.frame.width / 3 , height: collectionView.frame.width / 3)
        }
        
//        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//           switch indexPath.row {
//           case 0:
//
//            NavigationLink(destination: SegmentcontrolView()) {
//                 SegmentcontrolView()
//            }
//            break
//
//           case 1:
//            NavigationLink(destination: LoginView()) {
//                 LoginView()
//            }
//            break
//
//           default: break
//
//            }
//        }
        
    }
    
//    func makeUIViewController(context: UIViewControllerRepresentableContext<CollectionUI>) -> UICollectionView {
//        let layout = UICollectionViewFlowLayout()
//        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
//        layout.scrollDirection = .vertical
//        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        cv.dataSource = context.coordinator
//        cv.delegate = context.coordinator
//        cv.register(GenericCell.self, forCellWithReuseIdentifier: "cell")
//
//        cv.backgroundColor = .white
//        layout.minimumInteritemSpacing = 0
//        layout.minimumLineSpacing = 0
//        return cv
//    }
    
    func makeUIView(context: Context) -> UICollectionView {
        
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.dataSource = context.coordinator
        cv.delegate = context.coordinator
        
        cv.register(UINib(nibName: "CustomCell", bundle: nil), forCellWithReuseIdentifier: "CustomCell")

        cv.backgroundColor = .white
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        return cv
    }
    
    
    func updateUIView(_ uiView: UICollectionView, context: Context) {

    }
    
}
