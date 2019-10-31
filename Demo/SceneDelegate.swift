//
//  SceneDelegate.swift
//  Demo
//
//  Created by mac-00018 on 21/10/19.
//  Copyright © 2019 mac-00018. All rights reserved.
//

import UIKit
import SwiftUI

class UserSettings: ObservableObject {
    
    @Published var loggedIn : Bool = false
}

class UserOnboard: ObservableObject {
    
    @Published var onboardComplete : Bool = false
}

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).

        // Create the SwiftUI view that provides the window contents.
        // For use without property wrapper
        //        let contentView = StartView()
        //        let settings = UserSettings()
        //
        //        if UserDefaults.standard.bool(forKey: "Loggedin") {
        //            settings.loggedIn = true
        //        } else {
        //            settings.loggedIn = false
        //        }
        //
        //        // Use a UIHostingController as window root view controller.
        //        if let windowScene = scene as? UIWindowScene {
        //            let window = UIWindow(windowScene: windowScene)
        //            window.rootViewController = UIHostingController(rootView: contentView.environmentObject(settings))
        //            self.window = window
        //            window.makeKeyAndVisible()
        //        }
                
                let contentView = StartOnboardView()
                let onboard = UserOnboard()

                // Use a UIHostingController as window root view controller.
                if let windowScene = scene as? UIWindowScene {
                    let window = UIWindow(windowScene: windowScene)
                    window.rootViewController = UIHostingController(rootView: contentView.environmentObject(onboard))
        //            window.rootViewController = UIHostingController(rootView: ContentView())
                    self.window = window
                    window.makeKeyAndVisible()
                }
                
                // ==========
                
                
                // For with use of property wrapper
        //        let contentView = StartViewUsingPropertyWrappers()
        //        let dataStore = DataStore()
        //
        //        // Use a UIHostingController as window root view controller.
        //        if let windowScene = scene as? UIWindowScene {
        //            let window = UIWindow(windowScene: windowScene)
        //            window.rootViewController = UIHostingController(rootView: contentView.environmentObject(dataStore))
        //            self.window = window
        //            window.makeKeyAndVisible()
        //        }
        //
        //        let contentView = StartOnboard()
        //        let dataOnboard = DataOnboarding()
        //
        //        // Use a UIHostingController as window root view controller.
        //        if let windowScene = scene as? UIWindowScene {
        //            let window = UIWindow(windowScene: windowScene)
        //            window.rootViewController = UIHostingController(rootView: contentView.environmentObject(dataOnboard))
        //            self.window = window
        //            window.makeKeyAndVisible()
        //        }
                // ==========
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

struct StartView: View {
    
    @EnvironmentObject var settings: UserSettings
    
    var body: some View {
                
        if settings.loggedIn {
            return AnyView(TabbarVC())
        } else {
            return AnyView(LoginView())
        }
    }
}

struct StartOnboardView: View {
    
    @EnvironmentObject var userOnboard: UserOnboard
    
    var body: some View {
        
        let contentView = StartView()
        let settings = UserSettings()
                
        if userOnboard.onboardComplete {
            return AnyView(contentView.environmentObject(settings))
        } else {
            if UserDefaults.standard.bool(forKey: "Loggedin") {
                settings.loggedIn = true
                return AnyView(TabbarVC())
            } else {
                settings.loggedIn = false
                return AnyView(OnboardingView())
            }
        }
    }
}

struct StartViewUsingPropertyWrappers: View {
    
    @EnvironmentObject var dataStore: DataStore
    
    var body: some View {
                
        if dataStore.login {
            return AnyView(TabbarVC())
        } else {
            return AnyView(LoginView())
        }
    }
}

struct StartOnboard: View {
    
    @EnvironmentObject var dataOnboard: DataOnboarding
    
    var body: some View {
        
        let contentView = StartViewUsingPropertyWrappers()
        let dataStore = DataStore()
        
        if dataOnboard.onboard {
            return AnyView(contentView.environmentObject(dataStore))
        } else {
            return AnyView(OnboardingView())
        }
    }
}

