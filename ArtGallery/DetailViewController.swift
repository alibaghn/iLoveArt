//
//  DetailViewController.swift
//  ArtGallery
//
//  Created by Ali Bagherinia on 11/26/22.
//

import UIKit

class DetailViewController: UIViewController {
    let detailView = DetailView()
    let image : UIImage
    
    init(image: UIImage) {
        self.image = image
        detailView.imageView.image = image
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

extension DetailViewController {
    func setupUI() {
        view.addSubview(detailView)
        NSLayoutConstraint.activate([
            detailView.topAnchor.constraint(equalTo: view.topAnchor),
            detailView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            detailView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            detailView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
