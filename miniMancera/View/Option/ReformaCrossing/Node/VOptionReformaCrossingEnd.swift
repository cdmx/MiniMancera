import UIKit
import SpriteKit

class VOptionReformaCrossingEnd:SKSpriteNode
{
    private weak var controller:COptionReformaCrossing!
    private let kYPosition:CGFloat = 50
    private let kZPosition:CGFloat = 1001
    private let kSoundFail:String = "soundFail"
    
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
        
        if let sounds:Bool = MSession.sharedInstance.settings?.sounds
        {
            if sounds
            {
                let actionSound:SKAction = SKAction.playSoundFileNamed(
                    kSoundFail,
                    waitForCompletion:false)
                
                run(actionSound)
            }
        }
        
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
