//
//  HomeView.swift
//  SpaceExplorer
//
//  Created by Ali Bagherinia on 11/16/22.
//
import UIKit

class HomeView: UIView {
    let dailyImageView = UIImageView(image: UIImage(named: "defaultImage"))
    let marsTempView = UIView(frame: .zero)
    let asteroidView = UIView(frame: .zero)
    let stackView = UIStackView(frame: .zero)
    
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
        stackView.translatesAutoresizingMaskIntoConstraints = false
        dailyImageView.translatesAutoresizingMaskIntoConstraints = false
        marsTempView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(stackView)
        stackView.addArrangedSubview(dailyImageView)
        stackView.addArrangedSubview(marsTempView)
        stackView.addArrangedSubview(asteroidView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
            
        ])
        
        dailyImageView.backgroundColor = .red
        marsTempView.backgroundColor = .yellow
        asteroidView.backgroundColor = .orange
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
    }
}
