//
//  AppDelegate.swift
//  SpaceExplorer
//
//  Created by Ali Bagherinia on 11/16/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    let resultViewController = ResultViewController()
    let homeViewController = HomeViewController()
    let modelController = ModelController()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        window?.rootViewController = homeViewController
        homeViewController.homeView.navButton.addAction(UIAction(handler: { [self] _ in
            modelController.searchCat = self.homeViewController.searchCategory
            modelController.searchWord = self.homeViewController.homeView.textField.text
            print(modelController.searchCat!)
            print(modelController.searchWord!)
            self.window?.rootViewController = self.resultViewController
        }), for: .touchUpInside)

        resultViewController.resultView.backButton.addAction(UIAction(handler: { _ in
            self.window?.rootViewController = self.homeViewController
        }), for: .touchUpInside)
        return true
    }
}
