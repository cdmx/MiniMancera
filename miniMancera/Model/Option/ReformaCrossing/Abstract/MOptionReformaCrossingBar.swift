import UIKit
import SpriteKit

class MOptionReformaCrossingBar:SKSpriteNode
{
    private weak var model:MOptionReformaCrossing!
    private let kHeight:CGFloat = 64
    
    init(model:MOptionReformaCrossing)
    {
        self.model = model
        let sceneWidth:CGFloat = model.size.width
        let sceneWidth_2:CGFloat = sceneWidth / 2
        let sceneHeight:CGFloat = model.size.height
        let height_2:CGFloat = kHeight / 2
        let positionY:CGFloat = sceneHeight - height_2
        let size:CGSize = CGSize(width:0, height:kHeight)
        let position:CGPoint = CGPoint(x:sceneWidth_2, y:positionY)
        let color:UIColor = UIColor(white:0, alpha:0.5)
        
        super.init(texture:nil, color:color, size:size)
        self.position = position
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
