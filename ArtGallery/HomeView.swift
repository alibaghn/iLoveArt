//
//  HomeView.swift
//  ArtGallery
//
//  Created by Ali Bagherinia on 11/16/22.
//
import UIKit

class HomeView: UIView {
    let searchCatView = UIView()
    let searchWordView = UIView()
    let navigationView = UIView()
    let homeStack = UIStackView()
    let textField = UITextField()
    let navButton = UIButton()

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
        textField.translatesAutoresizingMaskIntoConstraints = false
        navButton.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(homeStack)
        homeStack.addArrangedSubview(searchCatView)
        homeStack.addArrangedSubview(searchWordView)
        homeStack.addArrangedSubview(navigationView)
   
        searchWordView.addSubview(textField)
        navigationView.addSubview(navButton)

        NSLayoutConstraint.activate([
            homeStack.topAnchor.constraint(equalTo: topAnchor),
            homeStack.bottomAnchor.constraint(equalTo: bottomAnchor),
            homeStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            homeStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            
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
        homeStack.distribution = .fillEqually
        textField.backgroundColor = .white
        navButton.setTitle("Get Results", for: .normal)
    }
}
