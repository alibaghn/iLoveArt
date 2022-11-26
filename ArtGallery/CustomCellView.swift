//
//  CustomCell.swift
//  ArtGallery
//
//  Created by Ali Bagherinia on 11/24/22.
//

import UIKit

class CustomCellView: UICollectionViewCell {
    let imageView = UIImageView(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CustomCellView {
    func setupUI() {
//        translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        
        NSLayoutConstraint.activate([
           imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
           imageView.trailingAnchor.constraint(equalTo: trailingAnchor)
           
           
           
           
        ])
        
        imageView.contentMode = .scaleToFill
        
    }
}
