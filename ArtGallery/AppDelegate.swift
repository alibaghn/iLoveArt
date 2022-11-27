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
    
    let homeViewController = HomeViewController()
    let modelController = ModelController.shared
    let resultViewController = ResultViewController()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let navigationController = UINavigationController(rootViewController: homeViewController)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        window?.rootViewController = navigationController
        homeViewController.homeView.navButton.addAction(UIAction(handler: { [self] _ in
            modelController.searchCat = self.homeViewController.searchCategory
            guard let userWord = homeViewController.homeView.textField.text, !userWord.isEmpty else {return}
            modelController.searchWord = userWord
            print(modelController.searchCat!)
            print(modelController.searchWord!)
            navigationController.pushViewController(resultViewController, animated: true)
        }), for: .touchUpInside)

//        resultViewController.resultView.backButton.addAction(UIAction(handler: { _ in
//            self.window?.rootViewController = self.homeViewController
//        }), for: .touchUpInside)
        return true
    }
}
