import UIKit
import Kingfisher

class NPicturesView: UIView {
    
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
        
    }
    
    private func formatSubviews() {
        
    }
    
    private func addConstraintsToSubviews() {
        
    }
}

extension NPicturesView: PostPictureView {
    func set(cell urls: [URL]) {
        
    }
}
