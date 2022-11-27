//
//  DetailView.swift
//  ArtGallery
//
//  Created by Ali Bagherinia on 11/26/22.
//

import UIKit

class DetailView: UIView {
    let dailyImageView = UIView(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DetailView {
    func setupUI() {
        translatesAutoresizingMaskIntoConstraints = false
        dailyImageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(dailyImageView)
        NSLayoutConstraint.activate([
            dailyImageView.topAnchor.constraint(equalTo: topAnchor),
            dailyImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            dailyImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            dailyImageView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        dailyImageView.backgroundColor = .red
    }
}
