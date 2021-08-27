import UIKit

class PostBodyView: UIView {
    private let date = UILabel()
    
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
        self.addSubviews([self.date])
    }
    
    private func formatSubviews() {
        self.backgroundColor = .white
        
        self.date.font = .systemFont(ofSize: 14)
        self.date.tintColor = .darkGray
        self.date.textAlignment = .center
    }
    
    private func addConstraintsToSubviews() {
        date.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
        }
    }
}

extension PostBodyView {
    func set(_ viewModel: PostSceneModel) {
        self.date.text = viewModel.date
        
        var pictureView: PostPictureView
        switch viewModel.type {
        case .single: pictureView = SinglePictureView()
        case .double: pictureView = DoublePictureView()
        case .triple: pictureView = TriplePictureView()
        case .n: pictureView = NPicturesView()
        }
        
        self.addSubview(pictureView)
        pictureView.set(cell: viewModel.pictures)
        pictureView.snp.makeConstraints { make in
            make.top.equalTo(self.date.snp.bottom).offset(8)
            make.left.right.bottom.equalToSuperview()
        }
    }
}
