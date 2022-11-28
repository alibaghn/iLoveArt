//
//  ResultViewController.swift
//  ArtGallery
//
//  Created by Ali Bagherinia on 11/20/22.
//

import UIKit

class ResultViewController: UIViewController {
    let customCellView = CustomCellView()
    let resultView = ResultView()
    let modelController = ModelController.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        Task {
            setupUI()
            await modelController.fetchArts()
            await modelController.loadImage()
            resultView.collectionView.dataSource = self
            resultView.collectionView.delegate = self
            resultView.collectionView.register(CustomCellView.self, forCellWithReuseIdentifier: "customCell")
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


    }
}

// MARK: - CollectionView Delegate

extension ResultViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(modelController.imageIds.count)
        return modelController.imageIds.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let customCell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as! CustomCellView
        customCell.backgroundColor = UIColor.blue
        customCell.imageView.image = modelController.images[indexPath.row]
        return customCell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
        navigationController?.pushViewController(DetailViewController(image: modelController.images[indexPath.row]), animated: true)
    }
}
