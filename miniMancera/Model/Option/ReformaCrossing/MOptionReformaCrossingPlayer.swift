import UIKit
import SpriteKit

class MOptionReformaCrossingPlayer:SKSpriteNode
{
    private let sceneSize:CGSize
    
    init(sceneSize:CGSize)
    {
        let texture:SKTexture = SKTexture(image:#imageLiteral(resourceName: "assetReformaCrossingPlayer0"))
        let size:CGSize = texture.size()
        
        super.init(texture:texture, color:UIColor.clear, size:size)
        self.sceneSize = sceneSize
        position = startPosition()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: private
    
    private func startPosition() -> CGPoint
    {
        let sceneWidth_2:CGFloat = sceneSize.width / 2.0
        let height_2:CGFloat = size.height / 2.0
        let point:CGPoint = CGPoint(x:sceneWidth_2, y:height_2)
        
        return point
    }
    
    private func finalPosition() -> CGPoint
    {
        let sceneWidth_2:CGFloat = sceneSize.width / 2.0
        let height_2:CGFloat = size.height / 2.0
        let point:CGPoint = CGPoint(x:sceneWidth_2, y:height_2)
        
        return point
    }
}
