//
//  ResultViewController.swift
//  ArtGallery
//
//  Created by Ali Bagherinia on 11/20/22.
//

import UIKit

class ResultViewController: UIViewController {
    let resultView = ResultView()

    func loadImage() async {
        let url = URL(string: "https://www.artic.edu/iiif/2/1adf2696-8489-499b-cad2-821d7fde4b33/full/843,/0/default.jpg")!
        do {
            let urlRequest = URLRequest(url: url)
            let (data, _) = try await URLSession.shared.data(for: urlRequest)
            resultView.dailyImageView.image = UIImage(data: data)
        } catch {
            print(error)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        Task {
//                    await ModelController.shared.fetchDailyImage()
                    await loadImage()
                }
        setupUI()
        
    }
}

extension ResultViewController {
    func setupUI() {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(resultView)
        NSLayoutConstraint.activate([
            resultView.topAnchor.constraint(equalTo: view.topAnchor),
            resultView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            resultView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            resultView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
