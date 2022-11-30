//
//  DetailViewController.swift
//  ArtGallery
//
//  Created by Ali Bagherinia on 11/26/22.
//

import UIKit

class DetailViewController: UIViewController {
    let detailView = DetailView()
    let image: UIImage
    let text: String
    

    init(image: UIImage, text: String) {
        self.image = image
        self.text = text
        detailView.imageView.image = image
        detailView.label.text = text
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
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
