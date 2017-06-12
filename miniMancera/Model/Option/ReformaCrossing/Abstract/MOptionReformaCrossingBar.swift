import UIKit
import SpriteKit

class MOptionReformaCrossingBar:SKSpriteNode
{
    private weak var controller:COptionReformaCrossing!
    private let kHeight:CGFloat = 64
    private let kAlpha:CGFloat = 0.3
    private let kZPosition:CGFloat = 1000
    
    init(controller:COptionReformaCrossing)
    {
        self.controller = controller
        let sceneSize:CGSize = controller.model.size
        let sceneWidth:CGFloat = sceneSize.width
        let sceneWidth_2:CGFloat = sceneWidth / 2.0
        let sceneHeight:CGFloat = sceneSize.height
        let height_2:CGFloat = kHeight / 2.0
        let positionY:CGFloat = sceneHeight - height_2
        let size:CGSize = CGSize(width:sceneWidth, height:kHeight)
        let position:CGPoint = CGPoint(x:sceneWidth_2, y:positionY)
        let color:UIColor = UIColor(white:0, alpha:kAlpha)
        
        super.init(texture:nil, color:color, size:size)
        self.position = position
        zPosition = kZPosition
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
