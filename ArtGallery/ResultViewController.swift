//
//  ResultViewController.swift
//  ArtGallery
//
//  Created by Ali Bagherinia on 11/20/22.
//

import UIKit

class ResultViewController: UIViewController {

    
    let resultView = ResultView()
    let modelController = ModelController.shared

    func loadImage() async {
        let url = URL(string: "https://www.artic.edu/iiif/2/\(modelController.imageId!)/full/843,/0/default.jpg")!
        do {
            let urlRequest = URLRequest(url: url)
            let (data, _) = try await URLSession.shared.data(for: urlRequest)
//            resultView.dailyImageView.image = UIImage(data: data)
        } catch {
            print(error)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        resultView.collectionView.register(CustomCell.self, forCellWithReuseIdentifier: "customCell")
        resultView.collectionView.dataSource = self
        resultView.collectionView.delegate = self
        Task {
                    await ModelController.shared.fetchArts()
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

//MARK: - CollectionView Delegate

extension ResultViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let customCell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as! CustomCell
                customCell.backgroundColor = UIColor.blue
                return customCell
    }
}
