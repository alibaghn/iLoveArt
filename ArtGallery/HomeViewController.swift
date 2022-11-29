//
//  ViewController.swift
//  SpaceExplorer
//
//  Created by Ali Bagherinia on 11/16/22.
//

import UIKit

class HomeViewController: UIViewController {
    let homeView = HomeView()




//    func loadImage() async {
//        let url = URL(string: modelController.dailyImageUrl!)!
//        do {
//            let urlRequest = URLRequest(url: url)
//            let (data, _) = try await URLSession.shared.data(for: urlRequest)
//            homeView.dailyImageView.image = UIImage(data: data)
//        } catch {
//            print(error)
//        }
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        homeView.textField.delegate = self
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
        setupUI()
       
        
        
//        Task {
//            await ModelController.shared.fetchDailyImage()
//            await loadImage()
//        }
    }
}

extension HomeViewController {
//    @objc func navButtonFunc(sender: UIButton) {
//
//        view.window?.rootViewController = ResultViewController()
//
//    }

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
        return true
    }
}
