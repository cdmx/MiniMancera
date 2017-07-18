import SpriteKit

extension MOptionTamalesOaxaquenosActions
{
    private static let kPlayerWalkingFrameDuration:TimeInterval = 0.16
    
    class func factoryPlayerWalkingnimation(texture:MGameTextureAnimated) -> SKAction
    {
        let action:SKAction = SKAction.animate(
            with:texture.textures,
            timePerFrame:kPlayerWalkingFrameDuration,
            resize:false,
            restore:false)
        let repeatForever:SKAction = SKAction.repeatForever(action)
        
        return repeatForever
    }
}
