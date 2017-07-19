import SpriteKit

extension MOptionTamalesOaxaquenosActions
{
    private static let kPlayerDiveImpulseX:CGFloat = 10
    private static let kPlayerJumpImpulseY:CGFloat = 30
    private static let kPlayerWalkingFrameDuration:TimeInterval = 0.16
    private static let kPlayerImpulseDuration:TimeInterval = 0.001
    
    class func factoryPlayerWalkingAnimation(texture:MGameTextureAnimated) -> SKAction
    {
        let action:SKAction = SKAction.animate(
            with:texture.textures,
            timePerFrame:kPlayerWalkingFrameDuration,
            resize:false,
            restore:false)
        let repeatForever:SKAction = SKAction.repeatForever(action)
        
        return repeatForever
    }
    
    class func factoryPlayerJumpImpulse() -> SKAction
    {
        let vectorVertical:CGVector = CGVector(
            dx:0,
            dy:kPlayerJumpImpulseY)
        
        let actionVertical:SKAction = SKAction.applyImpulse(
            vectorVertical,
            duration:kPlayerImpulseDuration)
        
        return actionVertical
    }
    
    class func factoryPlayerDiveImpulse() -> SKAction
    {
        let vectorVertical:CGVector = CGVector(
            dx:kPlayerDiveImpulseX,
            dy:0)
        
        let actionVertical:SKAction = SKAction.applyImpulse(
            vectorVertical,
            duration:kPlayerImpulseDuration)
        
        return actionVertical
    }
}
