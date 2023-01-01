//
//  DetailView.swift
//  ArtGallery
//
//  Created by Ali Bagherinia on 11/26/22.
//

import UIKit

class DetailView: UIView {
    let vStack = UIStackView()
    let imageView = UIImageView(frame: .zero)
    let textView = UIView(frame: .zero)
    let textViewStack = UIStackView()
    let titleLabel = UILabel(frame: .zero)
    let styleLabel = UILabel(frame: .zero)
    let artistLabel = UILabel(frame: .zero)
    let dateLabel = UILabel(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DetailView {
    func setupUI() {
        translatesAutoresizingMaskIntoConstraints = false
        vStack.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        textViewStack.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        artistLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        styleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(vStack)
        vStack.addArrangedSubview(imageView)
        vStack.addArrangedSubview(textView)
        textView.addSubview(textViewStack)
        textViewStack.addArrangedSubview(titleLabel)
        textViewStack.addArrangedSubview(styleLabel)
        textViewStack.addArrangedSubview(artistLabel)
        textViewStack.addArrangedSubview(dateLabel)
        
        NSLayoutConstraint.activate([
            vStack.topAnchor.constraint(equalTo: topAnchor),
            vStack.bottomAnchor.constraint(equalTo: bottomAnchor),
            vStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            vStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            textViewStack.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            titleLabel.topAnchor.constraint(equalToSystemSpacingBelow: textView.topAnchor, multiplier: 1),
            textViewStack.trailingAnchor.constraint(equalToSystemSpacingAfter: trailingAnchor, multiplier: 1)
        ])
        
        imageView.contentMode = .scaleToFill
        vStack.axis = .vertical
        textViewStack.axis = .vertical
        textViewStack.spacing = 10
        vStack.distribution = .fillEqually
        artistLabel.numberOfLines = 3
        titleLabel.numberOfLines = 3
    }
}
