import SpriteKit

extension MOptionWhistlesVsZombiesActions
{
    private static let kSonicReleaseFrameDuration:TimeInterval = 0.1
    private static let kSonicBoomFrameDuration:TimeInterval = 0.1
    private static let kSonicCollisionFrameDuration:TimeInterval = 0.1
    private static let kZombieWalkingFrameDuration:TimeInterval = 0.4
    
    class func factorySonicReleaseAnimation(texture:MGameTextureAnimated) -> SKAction
    {
        let action:SKAction = SKAction.animate(
            with:texture.textures,
            timePerFrame:kSonicReleaseFrameDuration,
            resize:false,
            restore:false)
        
        return action
    }
    
    class func factorySonicBoomAnimation(texture:MGameTextureAnimated) -> SKAction
    {
        let animation:SKAction = SKAction.animate(
            with:texture.textures,
            timePerFrame:kSonicBoomFrameDuration,
            resize:false,
            restore:false)
        
        let repeatForever:SKAction = SKAction.repeatForever(
            animation)
        
        return repeatForever
    }
    
    class func factorySonicCollisionAnimation(texture:MGameTextureAnimated) -> SKAction
    {
        let action:SKAction = SKAction.animate(
            with:texture.textures,
            timePerFrame:kSonicCollisionFrameDuration,
            resize:true,
            restore:false)
        
        return action
    }
    
    class func factoryZombieFootballAnimation(texture:MGameTextureAnimated) -> SKAction
    {
        let animation:SKAction = SKAction.animate(
            with:texture.textures,
            timePerFrame:kZombieWalkingFrameDuration,
            resize:false,
            restore:false)
        
        let repeatForever:SKAction = SKAction.repeatForever(
            animation)
        
        return repeatForever
    }
}
