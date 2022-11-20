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
    let HomeStack = UIStackView(frame: .zero)
    let artistsButton = UIButton(frame: .zero)
    let artworkButton = UIButton(frame: .zero)
    let searchCatStack = UIStackView(frame: .zero)
    
    
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
        HomeStack.translatesAutoresizingMaskIntoConstraints = false
        searchCatView.translatesAutoresizingMaskIntoConstraints = false
        searchWordView.translatesAutoresizingMaskIntoConstraints = false
        artistsButton.translatesAutoresizingMaskIntoConstraints = false
        artworkButton.translatesAutoresizingMaskIntoConstraints = false
        searchCatStack.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(HomeStack)
        HomeStack.addArrangedSubview(searchCatView)
        HomeStack.addArrangedSubview(searchWordView)
        searchCatStack.addArrangedSubview(artworkButton)
        searchCatStack.addArrangedSubview(artistsButton)
        searchCatView.addSubview(searchCatStack)

        

        
        NSLayoutConstraint.activate([
            HomeStack.topAnchor.constraint(equalTo: topAnchor),
            HomeStack.bottomAnchor.constraint(equalTo: bottomAnchor),
            HomeStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            HomeStack.trailingAnchor.constraint(equalTo: trailingAnchor)
            
            
        ])
        
        searchCatView.backgroundColor = .red
        searchWordView.backgroundColor = .yellow
        HomeStack.axis = .vertical
        searchCatStack.axis = .horizontal
        HomeStack.distribution = .fillEqually
        artistsButton.setTitle("Artists", for: .normal)
        artworkButton.setTitle("Artworks", for: .normal)
    }
}
