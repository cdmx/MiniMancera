import UIKit
import SpriteKit

class MOptionPollutedGardenFlowerPot:SKSpriteNode
{
    private weak var controller:COptionPollutedGarden!
    private let kScaleDuration:TimeInterval = 1
    private let kZPosition:CGFloat = 100
    private let kPositionY:CGFloat = 100
    private let kInitialScale:CGFloat = 0.1
    private let kFinalScale:CGFloat = 1
    
    init(controller:COptionPollutedGarden, positionX:CGFloat)
    {
        let texture:SKTexture = SKTexture(image:#imageLiteral(resourceName: "assetPollutedGardenFlowerPot"))
        let size:CGSize = texture.size()
        self.controller = controller
        
        super.init(texture:texture, color:UIColor.clear, size:size)
        position = CGPoint(x:positionX, y:kPositionY)
        zPosition = kZPosition
        isUserInteractionEnabled = true
        xScale = kInitialScale
        yScale = kInitialScale
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
    
    //MARK: public
    
    func animateAppear()
    {
        let actionScale:SKAction = SKAction.scale(to:kFinalScale, duration:kScaleDuration)
        
        run(actionScale)
    }
}
