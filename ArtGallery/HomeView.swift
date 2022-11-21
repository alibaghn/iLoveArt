//
//  HomeView.swift
//  ArtGallery
//
//  Created by Ali Bagherinia on 11/16/22.
//
import UIKit

class HomeView: UIView{
    
    let searchCatView = UIView(frame: .zero)
    let searchWordView = UIView(frame: .zero)
    let navigationView = UIView(frame: .zero)
    let homeStack = UIStackView(frame: .zero)
    let artistsButton = UIButton(frame: .zero)
    let catButton = UIButton(frame: .zero)
    let searchCatStack = UIStackView(frame: .zero)
    let textField = UITextField(frame: .zero)
    let navButton = UIButton(frame: .zero)


    
    
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
//    @objc func navButtonFunc(sender:UIButton){
//        //TODO:
//    }
    func setupUI() {
        translatesAutoresizingMaskIntoConstraints = false
        homeStack.translatesAutoresizingMaskIntoConstraints = false
        searchCatView.translatesAutoresizingMaskIntoConstraints = false
        searchWordView.translatesAutoresizingMaskIntoConstraints = false
        navigationView.translatesAutoresizingMaskIntoConstraints = false
        artistsButton.translatesAutoresizingMaskIntoConstraints = false
        catButton.translatesAutoresizingMaskIntoConstraints = false
        searchCatStack.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        navButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        addSubview(homeStack)
        homeStack.addArrangedSubview(searchCatView)
        homeStack.addArrangedSubview(searchWordView)
        homeStack.addArrangedSubview(navigationView)
        searchCatStack.addArrangedSubview(catButton)
        searchCatStack.addArrangedSubview(artistsButton)
        searchCatView.addSubview(searchCatStack)
        searchWordView.addSubview(textField)
        navigationView.addSubview(navButton)

        NSLayoutConstraint.activate([
            homeStack.topAnchor.constraint(equalTo: topAnchor),
            homeStack.bottomAnchor.constraint(equalTo: bottomAnchor),
            homeStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            homeStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            searchCatStack.centerXAnchor.constraint(equalTo: searchCatView.centerXAnchor),
            searchCatStack.centerYAnchor.constraint(equalTo: searchCatView.centerYAnchor),
            
            textField.centerXAnchor.constraint(equalTo: searchWordView.centerXAnchor),
            textField.centerYAnchor.constraint(equalTo: searchWordView.centerYAnchor),
            
            textField.topAnchor.constraint(equalToSystemSpacingBelow: searchWordView.topAnchor, multiplier: 5),
            textField.leadingAnchor.constraint(equalToSystemSpacingAfter: searchWordView.leadingAnchor, multiplier: 5),
            searchWordView.bottomAnchor.constraint(equalToSystemSpacingBelow: textField.bottomAnchor, multiplier: 5),
            searchWordView.trailingAnchor.constraint(equalToSystemSpacingAfter: textField.trailingAnchor, multiplier: 5),
            
            navButton.centerXAnchor.constraint(equalTo: navigationView.centerXAnchor),
            navButton.centerYAnchor.constraint(equalTo: navigationView.centerYAnchor)
            
        ])
        
        
        searchCatView.backgroundColor = .red
        searchWordView.backgroundColor = .yellow
        navigationView.backgroundColor = .orange
        homeStack.axis = .vertical
        searchCatStack.axis = .horizontal
        homeStack.distribution = .fillEqually
        searchCatStack.distribution = .fillEqually
        artistsButton.setTitle("Artists", for: .normal)
        catButton.setTitle("Artworks", for: .normal)
        textField.backgroundColor = .white
        navButton.setTitle("Get Results", for: .normal)
       
        
    }
}


