import SpriteKit

extension MOptionWhistlesVsZombiesActions
{
    private static let kSonicReleaseFrameDuration:TimeInterval = 0.1
    private static let kSonicBoomFrameDuration:TimeInterval = 0.1
    private static let kSonicCollisionFrameDuration:TimeInterval = 0.1
    private static let kZombieSonicColourTransition:TimeInterval = 0.2
    private static let kZombieSonicColourDuration:TimeInterval = 0.5
    private static let kZombieWalkingFrameDuration:TimeInterval = 0.4
    private static let kZombieDefeatedFrameDuration:TimeInterval = 0.2
    private static let kZombieDefeatedFadeOut:TimeInterval = 1
    private static let kZombieColourBlendFactor:CGFloat = 0.8
    
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
    
    class func factoryZombieSonicHitAnimation() -> SKAction
    {
        let colour:UIColor = UIColor(red:1, green:0, blue:0, alpha:0.8)
        let actionAddColour:SKAction = SKAction.colorize(
            with:colour,
            colorBlendFactor:kZombieColourBlendFactor,
            duration:kZombieSonicColourTransition)
        let actionWait:SKAction = SKAction.wait(
            forDuration:kZombieSonicColourDuration)
        let actionRemoveColour:SKAction = SKAction.colorize(
            with:colour,
            colorBlendFactor:0,
            duration:kZombieSonicColourTransition)
        
        let actions:[SKAction] = [
            actionAddColour,
            actionWait,
            actionRemoveColour]
        
        let sequence:SKAction = SKAction.sequence(actions)
        
        return sequence
    }
    
    class func factoryZombieFootballWalkingAnimation(texture:MGameTextureAnimated) -> SKAction
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
    
    class func factoryZombieFootballDefeatedAnimation(texture:MGameTextureAnimated) -> SKAction
    {
        let animation:SKAction = SKAction.animate(
            with:texture.textures,
            timePerFrame:kZombieDefeatedFrameDuration,
            resize:false,
            restore:false)
        let fadeOut:SKAction = SKAction.fadeOut(
            withDuration:kZombieDefeatedFadeOut)
        
        let actions:[SKAction] = [
            animation,
            fadeOut]
        
        let sequence:SKAction = SKAction.sequence(actions)
        
        return sequence
    }
}
