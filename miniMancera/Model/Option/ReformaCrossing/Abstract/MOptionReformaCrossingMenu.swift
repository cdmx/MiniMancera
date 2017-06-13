import UIKit
import SpriteKit

class MOptionReformaCrossingMenu:SKSpriteNode
{
    private weak var controller:COptionReformaCrossing!
    private let kMargin:CGFloat = 45
    private let kZPosition:CGFloat = 10002
    
    init(controller:COptionReformaCrossing)
    {
        let texture:SKTexture = SKTexture(image:#imageLiteral(resourceName: "assetReformaCrossingMenu"))
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
        let sceneHeight:CGFloat = controller.model.size.height
        let sizeWidth_2:CGFloat = size.width / 2.0
        let posY:CGFloat = sceneHeight - kMargin
        let point:CGPoint = CGPoint(x:sizeWidth_2, y:posY)
        
        return point
    }
}
