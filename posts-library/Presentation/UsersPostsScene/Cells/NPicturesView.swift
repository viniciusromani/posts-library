import UIKit
import Kingfisher

class NPicturesView: UIView {
    
    private let label = UILabel()
    
    init() {
        super.init(frame: .zero)
        self.buildViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func buildViews() {
        self.addSubviews()
        self.formatSubviews()
        self.addConstraintsToSubviews()
    }
    
    private func addSubviews() {
        self.addSubview(self.label)
    }
    
    private func formatSubviews() {
        self.label.text = "Not implemented yet"
        self.label.textAlignment = .center
        self.label.textColor = .gray
        self.label.font = .systemFont(ofSize: 24)
    }
    
    private func addConstraintsToSubviews() {
        label.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(44)
        }
    }
}

extension NPicturesView: PostPictureView {
    func set(cell urls: [URL]) {
        
    }
}
