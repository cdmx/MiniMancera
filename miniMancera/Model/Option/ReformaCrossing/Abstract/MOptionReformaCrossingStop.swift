import UIKit
import SpriteKit

class MOptionReformaCrossingStop:SKSpriteNode
{
    private weak var controller:COptionReformaCrossing!
    private let kMargin:CGFloat = 20
    private let kZPosition:CGFloat = 99999
    
    init(controller:COptionReformaCrossing)
    {
        let texture:SKTexture = SKTexture(image:#imageLiteral(resourceName: "assetReformaCrossingStop"))
        let size:CGSize = texture.size()
        self.controller = controller
        
        super.init(texture:texture, color:UIColor.clear, size:size)
        position = startPosition()
        zPosition = kZPosition
        isUserInteractionEnabled = true
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func touchesBegan(_ touches:Set<UITouch>, with event:UIEvent?)
    {
        controller.showMenu()
    }
    
    //MARK: private
    
    private func startPosition() -> CGPoint
    {
        let sceneWidth_2:CGFloat = controller.model.size.width / 2.0
        let sizeHeight_2:CGFloat = size.height / 2.0
        let posY:CGFloat = sizeHeight_2 - kMargin
        let point:CGPoint = CGPoint(x:sceneWidth_2, y:posY)
        
        return point
    }
}
