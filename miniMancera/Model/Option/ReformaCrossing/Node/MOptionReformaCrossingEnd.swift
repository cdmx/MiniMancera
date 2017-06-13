import UIKit
import SpriteKit

class MOptionReformaCrossingEnd:SKSpriteNode
{
    private weak var controller:COptionReformaCrossing!
    private let kYPosition:CGFloat = 50
    private let kZPosition:CGFloat = 1001
    
    init(controller:COptionReformaCrossing)
    {
        let texture:SKTexture = SKTexture(image:#imageLiteral(resourceName: "assetReformaCrossingGameOver"))
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
        isUserInteractionEnabled = false
        controller.exitGame()
    }
    
    //MARK: private
    
    private func startPosition() -> CGPoint
    {
        let sceneWidth_2:CGFloat = controller.model.size.width / 2.0
        let point:CGPoint = CGPoint(x:sceneWidth_2, y:kYPosition)
        
        return point
    }
}
