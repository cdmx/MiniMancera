import SpriteKit

class MOptionWhistlesVsZombiesActions
{
    let actionFadeIn:SKAction
    let actionFadeOut:SKAction
    let actionFadeOutIn:SKAction
    let transitionCrossFade:SKTransition
    private(set) var actionSonicReleaseAnimation:SKAction!
    private(set) var actionSonicBoomAnimation:SKAction!
    private(set) var actionZombieFootballWakingAnimation:SKAction!
    private let kFadeDuration:TimeInterval = 0.3
    private let kSonicReleaseFrameDuration:TimeInterval = 0.1
    private let kSonicBoomFrameDuration:TimeInterval = 0.1
    private let kZombieWalkingFrameDuration:TimeInterval = 0.2
    private let kSceneTransitionDuration:TimeInterval = 1
    
    init()
    {
        actionFadeIn = SKAction.fadeIn(withDuration:kFadeDuration)
        actionFadeOut = SKAction.fadeOut(withDuration:kFadeDuration)
        
        let sequenceOutIn:[SKAction] = [
            actionFadeOut,
            actionFadeIn]
        actionFadeOutIn = SKAction.sequence(sequenceOutIn)
        transitionCrossFade = SKTransition.crossFade(withDuration:kSceneTransitionDuration)
    }
    
    //MARK: private
    
    private func factorySonicReleaseAnimation(texture:MGameTextureAnimated)
    {
        actionSonicReleaseAnimation = SKAction.animate(
            with:texture.textures,
            timePerFrame:kSonicReleaseFrameDuration,
            resize:false,
            restore:false)
    }
    
    private func factorySonicBoomAnimation(texture:MGameTextureAnimated)
    {
        let animation:SKAction = SKAction.animate(
            with:texture.textures,
            timePerFrame:kSonicBoomFrameDuration,
            resize:false,
            restore:false)
        
        actionSonicBoomAnimation = SKAction.repeatForever(
            animation)
    }
    
    private func factoryZombieFootballAnimation(texture:MGameTextureAnimated)
    {
        let animation:SKAction = SKAction.animate(
            with:texture.textures,
            timePerFrame:kZombieWalkingFrameDuration,
            resize:false,
            restore:false)
        
        actionZombieFootballWakingAnimation = SKAction.repeatForever(
            animation)
    }
    
    //MARK: public
    
    func factoryAnimations(textures:MOptionWhistlesVsZombiesTextures)
    {
        factorySonicReleaseAnimation(texture:textures.sonicReleaseAnimated)
        factorySonicBoomAnimation(texture:textures.sonicBoomAnimated)
        factoryZombieFootballAnimation(texture:textures.zombieFootballWalkingAnimated)
    }
}
