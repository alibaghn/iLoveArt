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
    let imageTitle: String
    let artist: String
    let date: String
    let style: String

    init(image: UIImage, imageTitle: String, artist: String, date: String, style: String) {
        self.image = image
        self.imageTitle = imageTitle
        self.artist = artist
        self.date = date
        self.style = date
        detailView.imageView.image = image
        detailView.titleLabel.text = "Title: \(imageTitle)"
        detailView.styleLabel.text = "Style: \(style)"
        detailView.artistLabel.text = "Artist: \(artist)".filter { !$0.isNewline
        }
        detailView.dateLabel.text = "Date Created: \(date)"
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
