import UIKit
import SpriteKit

class MOptionReformaCrossingStop:SKSpriteNode
{
    private weak var controller:COptionReformaCrossing!
    private let animationTextures:[SKTexture]
    private let kZPosition:CGFloat = 99999
    private let kAnimationFrameTime:TimeInterval = 0.04
    
    private class func factoryAnimationTextures() -> [SKTexture]
    {
        let texture1:SKTexture = SKTexture(image:#imageLiteral(resourceName: "assetReformaCrossingStop1"))
        let texture2:SKTexture = SKTexture(image:#imageLiteral(resourceName: "assetReformaCrossingStop2"))
        let texture3:SKTexture = SKTexture(image:#imageLiteral(resourceName: "assetReformaCrossingStop3"))
        let texture4:SKTexture = SKTexture(image:#imageLiteral(resourceName: "assetReformaCrossingStop4"))
        let texture5:SKTexture = SKTexture(image:#imageLiteral(resourceName: "assetReformaCrossingStop5"))
        
        let textures:[SKTexture] = [
            texture1,
            texture2,
            texture3,
            texture4,
            texture5]
        
        return textures
    }
    
    init(controller:COptionReformaCrossing)
    {
        let texture:SKTexture = SKTexture(image:#imageLiteral(resourceName: "assetReformaCrossingStop0"))
        animationTextures = MOptionReformaCrossingStop.factoryAnimationTextures()
        
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
    
    override func touchesEnded(_ touches:Set<UITouch>, with event:UIEvent?)
    {
        isUserInteractionEnabled = false
        animateStop()
        controller.playerStop()
    }
    
    //MARK: private
    
    private func startPosition() -> CGPoint
    {
        let sceneWidth_2:CGFloat = controller.model.size.width / 2.0
        let sizeHeight_2:CGFloat = size.height / 2.0
        let point:CGPoint = CGPoint(x:sceneWidth_2, y:sizeHeight_2)
        
        return point
    }
    
    private func animateStop()
    {
        let actionAnimation:SKAction = SKAction.animate(
            with:animationTextures,
            timePerFrame:kAnimationFrameTime,
            resize:false,
            restore:true)
        let actionReEnable:SKAction = SKAction.run(reEnable)
        let actions:[SKAction] = [
            actionAnimation,
            actionReEnable]
        let actionsSequence:SKAction = SKAction.sequence(actions)
        
        run(actionsSequence)
    }
    
    private func reEnable()
    {
        isUserInteractionEnabled = true
    }
    
    //MARK: public
    
    func update()
    {
        
    }
}
