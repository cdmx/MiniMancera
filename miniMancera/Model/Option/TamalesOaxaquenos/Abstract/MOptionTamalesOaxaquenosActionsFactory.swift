import SpriteKit

extension MOptionTamalesOaxaquenosActions
{
    private static let kPlayerJumpImpulseX:CGFloat = 3
    private static let kPlayerJumpImpulseY:CGFloat = 20
    private static let kPlayerWalkingFrameDuration:TimeInterval = 0.16
    private static let kPlayerJumpDuration:TimeInterval = 0.01
    
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
        
        let vectorHorizontal:CGVector = CGVector(
            dx:kPlayerJumpImpulseX,
            dy:0)
        
        let actionVertical:SKAction = SKAction.applyImpulse(
            vectorVertical,
            duration:kPlayerJumpDuration)
        let actionHorizontal:SKAction = SKAction.applyImpulse(
            vectorHorizontal,
            duration:kPlayerJumpDuration)
        let actions:[SKAction] = [
            actionVertical,
            actionHorizontal]
        let sequence:SKAction = SKAction.sequence(actions)
        
        return sequence
    }
}
