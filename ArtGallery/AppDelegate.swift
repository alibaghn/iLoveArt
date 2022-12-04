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
    var resultViewController = ResultViewController()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        window?.rootViewController = homeViewController
        homeViewController.homeView.searchButton.addAction(UIAction(handler: { [self] _ in
            guard let userWord = homeViewController.homeView.textField.text, !userWord.isEmpty else { return }
            modelController.searchWord = String(userWord.filter { !$0.isWhitespace })
        
            let navigationController = UINavigationController(rootViewController: resultViewController)
            window?.rootViewController = navigationController
        }), for: .touchUpInside)


        return true
    }
}


