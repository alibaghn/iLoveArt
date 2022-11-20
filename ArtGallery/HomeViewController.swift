//
//  ViewController.swift
//  SpaceExplorer
//
//  Created by Ali Bagherinia on 11/16/22.
//

import UIKit

class HomeViewController: UIViewController {
    let modelController = ModelController.shared
    let homeView = HomeView()
    var searchCategory = SearchCategory.Artworks

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
        setupUI()
//        Task {
//            await ModelController.shared.fetchDailyImage()
//            await loadImage()
//        }
    }
}

extension HomeViewController {
    func setupUI() {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(homeView)

        NSLayoutConstraint.activate([
            homeView.topAnchor.constraint(equalTo: view.topAnchor),
            homeView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            homeView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            homeView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
