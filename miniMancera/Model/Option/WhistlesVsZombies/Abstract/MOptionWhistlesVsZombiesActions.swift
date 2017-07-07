import SpriteKit

class MOptionWhistlesVsZombiesActions
{
    let actionFadeIn:SKAction
    let actionFadeOut:SKAction
    let actionFadeOutIn:SKAction
    let transitionCrossFade:SKTransition
    private let actionSonicReleaseAnimation:SKAction
    private let actionSonicBoomAnimation:SKAction
    private let actionZombieFootballWakingAnimation:SKAction
    private let kFadeDuration:TimeInterval = 0.3
    private let kSceneTransitionDuration:TimeInterval = 1
    
    init(textures:MOptionWhistlesVsZombiesTextures)
    {
        actionFadeIn = SKAction.fadeIn(withDuration:kFadeDuration)
        actionFadeOut = SKAction.fadeOut(withDuration:kFadeDuration)
        
        let sequenceOutIn:[SKAction] = [
            actionFadeOut,
            actionFadeIn]
        actionFadeOutIn = SKAction.sequence(sequenceOutIn)
        
        transitionCrossFade = SKTransition.crossFade(withDuration:kSceneTransitionDuration)
        
        actionSonicReleaseAnimation = MOptionWhistlesVsZombiesActions.factorySonicReleaseAnimation(
            texture:textures.sonicReleaseAnimated)
        actionSonicBoomAnimation = MOptionWhistlesVsZombiesActions.factorySonicBoomAnimation(
            texture:textures.sonicBoomAnimated)
        actionZombieFootballWakingAnimation = MOptionWhistlesVsZombiesActions.factoryZombieFootballAnimation(
            texture:textures.zombieFootballWalkingAnimated)
    }
}
