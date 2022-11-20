//
//  HomeView.swift
//  ArtGallery
//
//  Created by Ali Bagherinia on 11/16/22.
//
import UIKit

class HomeView: UIView {
    
    let searchCatView = UIView(frame: .zero)
    let searchWordView = UIView(frame: .zero)
    let navigationView = UIView(frame: .zero)
    let homeStack = UIStackView(frame: .zero)
    let artistsButton = UIButton(frame: .zero)
    let artworkButton = UIButton(frame: .zero)
    let searchCatStack = UIStackView(frame: .zero)
    let textField = UITextField(frame: CGRect(x: 0, y: 0, width: 50, height: 50))

    
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupUI()
    }
  
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeView {
    func setupUI() {
        translatesAutoresizingMaskIntoConstraints = false
        homeStack.translatesAutoresizingMaskIntoConstraints = false
        searchCatView.translatesAutoresizingMaskIntoConstraints = false
        searchWordView.translatesAutoresizingMaskIntoConstraints = false
        navigationView.translatesAutoresizingMaskIntoConstraints = false
        artistsButton.translatesAutoresizingMaskIntoConstraints = false
        artworkButton.translatesAutoresizingMaskIntoConstraints = false
        searchCatStack.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(homeStack)
        homeStack.addArrangedSubview(searchCatView)
        homeStack.addArrangedSubview(searchWordView)
        homeStack.addArrangedSubview(navigationView)
        searchCatStack.addArrangedSubview(artworkButton)
        searchCatStack.addArrangedSubview(artistsButton)
        searchCatView.addSubview(searchCatStack)
        searchWordView.addSubview(textField)

        NSLayoutConstraint.activate([
            homeStack.topAnchor.constraint(equalTo: topAnchor),
            homeStack.bottomAnchor.constraint(equalTo: bottomAnchor),
            homeStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            homeStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            searchCatStack.centerXAnchor.constraint(equalTo: searchCatView.centerXAnchor),
            searchCatStack.centerYAnchor.constraint(equalTo: searchCatView.centerYAnchor),
            
            textField.centerXAnchor.constraint(equalTo: searchWordView.centerXAnchor),
            textField.centerYAnchor.constraint(equalTo: searchWordView.centerYAnchor),
            
            textField.topAnchor.constraint(equalToSystemSpacingBelow: searchWordView.topAnchor, multiplier: 1),
            textField.leadingAnchor.constraint(equalToSystemSpacingAfter: searchWordView.leadingAnchor, multiplier: 1),
            searchWordView.bottomAnchor.constraint(equalToSystemSpacingBelow: textField.bottomAnchor, multiplier: 1),
            searchWordView.trailingAnchor.constraint(equalToSystemSpacingAfter: textField.trailingAnchor, multiplier: 1)
            
        ])
        
        searchCatView.backgroundColor = .red
        searchWordView.backgroundColor = .yellow
        navigationView.backgroundColor = .orange
        homeStack.axis = .vertical
        searchCatStack.axis = .horizontal
        homeStack.distribution = .fillEqually
        searchCatStack.distribution = .fillEqually
        artistsButton.setTitle("Artists", for: .normal)
        artworkButton.setTitle("Artworks", for: .normal)
        textField.backgroundColor = .gray
        
    }
}
