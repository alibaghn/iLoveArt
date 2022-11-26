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

    func loadImage() async {
        print(modelController.imageIds.count)
        for id in modelController.imageIds {
            let url = URL(string: "https://www.artic.edu/iiif/2/\(id)/full/843,/0/default.jpg")!
            do {
                let urlRequest = URLRequest(url: url)
                let (data, response) = try await URLSession.shared.data(for: urlRequest)
                guard (response as? HTTPURLResponse)?.statusCode == 200 else { return }
                if let newImage = UIImage(data: data) {
                    modelController.images.append(newImage)
                }
                
            } catch {
                print("error: \(error)")
            }
        }
        print(modelController.images)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        Task {
            await ModelController.shared.fetchArts()
            await loadImage()
            resultView.collectionView.dataSource = self
            resultView.collectionView.delegate = self
            resultView.collectionView.register(CustomCellView.self, forCellWithReuseIdentifier: "customCell")
        }

        
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
}
