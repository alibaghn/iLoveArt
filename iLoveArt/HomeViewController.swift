//
//  ViewController.swift
//  SpaceExplorer
//
//  Created by Ali Bagherinia on 11/16/22.
//

import UIKit

class HomeViewController: UIViewController {
    let homeView = HomeView()

    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
        setupUI()
    }
}

extension HomeViewController {
    func setupUI() {
        view.addSubview(homeView)

        NSLayoutConstraint.activate([
            homeView.topAnchor.constraint(equalTo: view.topAnchor),
            homeView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            homeView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            homeView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension HomeViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        guard let userWord = textField.text, !userWord.isEmpty else { return false }
        ModelController.shared.searchWord = String(userWord.filter { !$0.isWhitespace })

        return true
    }
}
