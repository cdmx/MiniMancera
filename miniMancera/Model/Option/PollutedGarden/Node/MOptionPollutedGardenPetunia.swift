import UIKit
import SpriteKit

class MOptionPollutedGardenPetunia:SKSpriteNode
{
    private weak var controller:COptionPollutedGarden!
    private weak var flowerPot:MOptionPollutedGardenFlowerPot!
    private var level:Int
    private let kZPosition:CGFloat = 400
    
    init(controller:COptionPollutedGarden, flowerPot:MOptionPollutedGardenFlowerPot)
    {
        let size:CGSize = controller.model.petuniaLife.textureSize
        self.controller = controller
        self.flowerPot = flowerPot
        level = 0
        
        super.init(texture:nil, color:UIColor.clear, size:size)
        position = startPosition()
        zPosition = kZPosition
        isUserInteractionEnabled = true
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func touchesEnded(_ touches:Set<UITouch>, with event:UIEvent?)
    {
        if controller.model.gameActive
        {
        }
    }
    
    //MARK: private
    
    private func startPosition() -> CGPoint
    {
        let potPosition:CGPoint = flowerPot.position
        let potX:CGFloat = potPosition.x
        let potY:CGFloat = potPosition.y
        let potHeight:CGFloat = flowerPot.size.height
        let potHeight_2:CGFloat = potHeight / 2.0
        let textureHeight:CGFloat = size.height
        let textureHeight_2:CGFloat = textureHeight / 2.0
        let positionY:CGFloat = potY + potHeight_2 + textureHeight_2
        let point:CGPoint = CGPoint(x:potX, y:positionY)
        
        return point
    }
    
    //MARK: public
    
}
