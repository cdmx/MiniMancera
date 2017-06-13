import UIKit
import SpriteKit

class MOptionReformaCrossingHud:SKSpriteNode
{
    private weak var controller:COptionReformaCrossing!
    private let kMargin:CGFloat = 45
    private let kZPosition:CGFloat = 10001
    
    init(controller:COptionReformaCrossing)
    {
        let texture:SKTexture = SKTexture(image:#imageLiteral(resourceName: "assetReformaCrossingHud"))
        let size:CGSize = texture.size()
        self.controller = controller
        
        super.init(texture:texture, color:UIColor.clear, size:size)
        position = startPosition()
        zPosition = kZPosition
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: private
    
    private func startPosition() -> CGPoint
    {
        let sceneSize:CGSize = controller.model.size
        let sceneWidth:CGFloat = sceneSize.width
        let sceneHeight:CGFloat = sceneSize.height
        let sizeWidth_2:CGFloat = size.width / 2.0
        let posX:CGFloat = sceneWidth - sizeWidth_2
        let posY:CGFloat = sceneHeight - kMargin
        let point:CGPoint = CGPoint(x:posX, y:posY)
        
        return point
    }
    
    //MARK: public
    
    func update(elapsedTime:TimeInterval)
    {
        
    }
}
