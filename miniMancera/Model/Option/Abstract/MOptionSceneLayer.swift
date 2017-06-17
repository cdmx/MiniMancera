import UIKit
import SpriteKit

class MOptionSceneLayer<S:MOptionProtocol, T:ControllerGame<S>>:SKNode
{
    private weak var controller:T!
    
    init(controller:T)
    {
        super.init()
        let sceneSize:CGSize = controller.model.size
        let sceneWidth:CGFloat = sceneSize.width
        let sceneHeight:CGFloat = sceneSize.height
        let sceneWidth_2:CGFloat = sceneWidth / 2.0
        let sceneHeight_2:CGFloat = sceneHeight / 2.0
        let centerPosition:CGPoint = CGPoint(x:sceneWidth_2, y:sceneHeight_2)
        self.size
        position = centerPosition
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        return nil
    }
}
