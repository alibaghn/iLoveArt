
import UIKit

class ResultView: UIView {
    let dailyImageView = UIImageView(frame: .zero)
    let backButton = UIButton()
 
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ResultView {
    func setupUI() {
        translatesAutoresizingMaskIntoConstraints = false
        dailyImageView.translatesAutoresizingMaskIntoConstraints = false
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.setTitle("Back", for: .normal)
        addSubview(dailyImageView)
        addSubview(backButton)
    
        
        
        NSLayoutConstraint.activate([
            dailyImageView.topAnchor.constraint(equalTo: topAnchor),
            dailyImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            dailyImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            dailyImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            backButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            backButton.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        dailyImageView.backgroundColor = .red
        
    }
}
