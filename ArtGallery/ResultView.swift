
import UIKit

class ResultView: UIView {
    let dailyImageView = UIView(frame: .zero)
 
    
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
