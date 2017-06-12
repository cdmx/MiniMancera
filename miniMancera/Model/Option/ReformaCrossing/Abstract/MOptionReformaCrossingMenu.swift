import UIKit
import SpriteKit

class MOptionReformaCrossingMenu:SKSpriteNode
{
    private weak var model:MOptionReformaCrossing!
    private let kMargin:CGFloat = 30
    
    init(model:MOptionReformaCrossing)
    {
        let texture:SKTexture = SKTexture(image:#imageLiteral(resourceName: "assetReformaCrossingMenu"))
        let size:CGSize = texture.size()
        self.model = model
        
        print(size)
        
        super.init(texture:texture, color:UIColor.clear, size:size)
        position = startPosition()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: private
    
    private func startPosition() -> CGPoint
    {
        let sceneHeight:CGFloat = model.size.height
        let posY:CGFloat = sceneHeight - kMargin
        let point:CGPoint = CGPoint(x:kMargin, y:posY)
        
        return point
    }
}
