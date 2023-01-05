//
//  ResultViewController.swift
//  ArtGallery
//
//  Created by Ali Bagherinia on 11/20/22.
//

import UIKit
import SDWebImage

class ResultViewController: UIViewController {
    let customCellView = CustomCellView()
    let resultView = ResultView()
    let modelController = ModelController.shared

    @objc func backButtonPressed() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = appDelegate.homeViewController
        appDelegate.resultViewController = ResultViewController()
        modelController.reset()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        Task {
            setupUI()
            resultView.spinner.startAnimating()
            await modelController.fetchArts()
            await modelController.loadImages()
            resultView.collectionView.dataSource = self
            resultView.collectionView.delegate = self
            resultView.collectionView.register(CustomCellView.self, forCellWithReuseIdentifier: "customCell")
            resultView.spinner.stopAnimating()
        }
    }
}

extension ResultViewController {
    func setupUI() {
        view.addSubview(resultView)
        NSLayoutConstraint.activate([
            resultView.topAnchor.constraint(equalTo: view.topAnchor),
            resultView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            resultView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            resultView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])

        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: resultView.backButton)
        resultView.backButton.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
    }
}

// MARK: - CollectionView Delegate

extension ResultViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return modelController.images.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let customCell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as! CustomCellView
//        customCell.imageView.image = modelController.images[indexPath.row]


        return customCell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        navigationController?.pushViewController(DetailViewController(image: modelController.images[indexPath.row], imageTitle: modelController.imageData[indexPath.row].title, artist: modelController.imageData[indexPath.row].artist_display, date: modelController.imageData[indexPath.row].date_display, style: modelController.imageData[indexPath.row].style_title), animated: false)
    }
}
