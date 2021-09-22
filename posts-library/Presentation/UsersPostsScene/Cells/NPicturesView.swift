import UIKit
import Kingfisher
import RxSwift

class NPicturesView: UIView {
    
    private let bigImage = UIImageView()
    private let collection = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    weak var delegate: UserPostTableViewCellDelegate?
    var disposeBag: DisposeBag = DisposeBag()
    
    private var urls = [URL]()
    
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
        self.addTapGesture(to: self.bigImage)
        
        self.addSubviews([self.bigImage,
                          self.collection])
    }
    
    private func formatSubviews() {
        self.backgroundColor = .white
        
        self.bigImage.layer.masksToBounds = true
        self.bigImage.layer.cornerRadius = 8
        self.bigImage.contentMode = .scaleAspectFill
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = 8
//        flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        flowLayout.scrollDirection = .horizontal
        
        self.collection.backgroundColor = .clear
        self.collection.delegate = self
        self.collection.dataSource = self
        self.collection.registerCell(NPicturesCollectionViewCell.self)
    }
    
    private func addConstraintsToSubviews() {
        bigImage.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(8)
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(350)
        }
        
        collection.snp.makeConstraints { make in
            make.top.equalTo(self.bigImage.snp.bottom).offset(8)
            make.left.right.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(8)
            make.height.equalTo(200)
        }
    }
}

extension NPicturesView: PostPictureViewConfigurable {
    func configure(urls: [URL], delegate: UserPostTableViewCellDelegate?) {
        self.delegate = delegate
        
        self.bigImage.kf.setImage(with: urls.first, options: [.transition(.fade(0.5))])
        self.urls = Array(urls.dropFirst())
        self.collection.reloadData()
    }
}

extension NPicturesView: PostPictureView {
    
}

extension NPicturesView: UICollectionViewDelegate {
    
}

extension NPicturesView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.urls.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: NPicturesCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.configure(urls: [self.urls[indexPath.row]], delegate: self.delegate)
        return cell
    }
}

extension NPicturesView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellHeight = CGFloat(170)
        let cellSpacing = (collectionViewLayout as? UICollectionViewFlowLayout)?.minimumInteritemSpacing ?? 8
        let halfOfWidth = (collectionView.frame.width - cellSpacing) / 2
        let size = CGSize(width: halfOfWidth, height: cellHeight)
        return size
    }
}
