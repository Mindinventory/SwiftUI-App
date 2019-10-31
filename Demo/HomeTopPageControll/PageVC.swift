//
//  PageViewController.swift
//  App Onboarding
//
//  Created by Andreas Schultz on 10.08.19.
//  Copyright © 2019 Andreas Schultz. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

struct PageVC: UIViewControllerRepresentable {
    
    @Binding var currentPageIndex: Int
    
 var viewControllers: [UIViewController]
        
        class Coordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
            
            var parent: PageVC
            
            init(_ pageViewController: PageVC) {
                self.parent = pageViewController
            }
            
            func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
                
                //retrieves the index of the currently displayed view controller
                guard let index = parent.viewControllers.firstIndex(of: viewController) else {
                     return nil
                 }
                
                //shows the last view controller when the user swipes back from the first view controller
                if index == 0 {
                    return parent.viewControllers.last
                }
                
                //show the view controller before the currently displayed view controller
                return parent.viewControllers[index - 1]
            }
            
            func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
                
                //retrieves the index of the currently displayed view controller
                guard let index = parent.viewControllers.firstIndex(of: viewController) else {
                    return nil
                }
                
                //shows the first view controller when the user swipes further from the last view controller
                if index + 1 == parent.viewControllers.count {
                    return parent.viewControllers.first
                }
                
                //show the view controller after the currently displayed view controller
                return parent.viewControllers[index + 1]
            }
            
            func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
                
                if completed, let visibleViewController = pageViewController.viewControllers?.first, let index = parent.viewControllers.firstIndex(of: visibleViewController) {
                    parent.currentPageIndex = index
                }
            }
        }
        
        func makeCoordinator() -> Coordinator {
            Coordinator(self)
        }
        
        func makeUIViewController(context: Context) -> UIPageViewController {
            
            let pageViewController = UIPageViewController(
                transitionStyle: .scroll,
                navigationOrientation: .horizontal
            )
            
            pageViewController.dataSource = context.coordinator
            pageViewController.delegate = context.coordinator
            
            return pageViewController
        }
        
        func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
            
            pageViewController.setViewControllers(
                [viewControllers[currentPageIndex]],
                direction: .forward,
                animated: true
            )
        }
    }
