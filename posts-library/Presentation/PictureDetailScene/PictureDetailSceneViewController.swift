import UIKit

class PictureDetailSceneViewController: UIViewController {
    private var pictureDetailView: PictureDetailView!
    
    private let sceneModel: PictureDetailSceneModel
    
    init(sceneModel: PictureDetailSceneModel) {
        self.sceneModel = sceneModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.pictureDetailView = PictureDetailView()
        self.view = self.pictureDetailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pictureDetailView.set(image: self.sceneModel.image)
    }
}
