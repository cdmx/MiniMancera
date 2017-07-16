import SpriteKit

extension MOptionTamalesOaxaquenosActions
{
    private static let kPlayerWalkingFrameDuration:TimeInterval = 0.1
    
    class func factoryPlayerWalkingnimation(texture:MGameTextureAnimated) -> SKAction
    {
        let action:SKAction = SKAction.animate(
            with:texture.textures,
            timePerFrame:kPlayerWalkingFrameDuration,
            resize:false,
            restore:false)
        
        return action
    }
}
