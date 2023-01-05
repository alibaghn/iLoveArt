//
//  AppDelegate.swift
//  SpaceExplorer
//
//  Created by Ali Bagherinia on 11/16/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate, UITextFieldDelegate {
    var window: UIWindow?
    let homeViewController = HomeViewController()
    let modelController = ModelController.shared
    var resultViewController = ResultViewController()

    func onSearch() {
        guard let userWord = homeViewController.homeView.textField.text, !userWord.isEmpty else { return }
        modelController.searchWord = String(userWord.filter { !$0.isWhitespace })
        let navigationController = UINavigationController(rootViewController: resultViewController)
        window?.rootViewController = navigationController
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        homeViewController.homeView.textField.delegate = self
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        window?.rootViewController = homeViewController
        homeViewController.homeView.searchButton.addAction(UIAction(handler: { [self] _ in
            onSearch()
        }), for: .touchUpInside)

        return true
    }
}

extension AppDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        homeViewController.view.endEditing(true)
        onSearch()
        return true
    }
}
