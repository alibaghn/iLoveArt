//
//  DetailView.swift
//  ArtGallery
//
//  Created by Ali Bagherinia on 11/26/22.
//

import UIKit

class DetailView: UIView {
    let stackView = UIStackView()
    let imageView = UIImageView(frame: .zero)
    let textView = UIView(frame: .zero)
    let label = UILabel(frame: .zero)
    
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
        stackView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(stackView)
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(textView)
        textView.addSubview(label)
        
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
//            label.topAnchor.constraint(equalTo: textView.topAnchor),
//            label.bottomAnchor.constraint(equalTo: textView.bottomAnchor),
//            label.leadingAnchor.constraint(equalTo: textView.leadingAnchor),
//            label.trailingAnchor.constraint(equalTo: textView.trailingAnchor),
//            
//            label.centerXAnchor.constraint(equalTo: textView.centerXAnchor),
//            label.centerYAnchor.constraint(equalTo: textView.centerYAnchor)
        ])
        

        imageView.contentMode = .scaleToFill
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        label.text = "This is a test"
    }
}
