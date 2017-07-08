import SpriteKit

class MOptionWhistlesVsZombiesActions
{
    let actionFadeIn:SKAction
    let actionFadeOut:SKAction
    let actionFadeOutIn:SKAction
    let transitionCrossFade:SKTransition
    let actionSonicReleaseAnimation:SKAction
    let actionSonicBoomAnimation:SKAction
    let actionSonicCollisionAnimation:SKAction
    let actionZombieSonicHit:SKAction
    let actionZombieFootballWakingAnimation:SKAction
    let actionZombieFootballDefeatedAnimation:SKAction
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
        actionSonicCollisionAnimation = MOptionWhistlesVsZombiesActions.factorySonicCollisionAnimation(
            texture:textures.sonicCollisionAnimated)
        
        actionZombieSonicHit = MOptionWhistlesVsZombiesActions.factoryZombieSonicHitAnimation()
        
        actionZombieFootballWakingAnimation = MOptionWhistlesVsZombiesActions.factoryZombieFootballWalkingAnimation(
            texture:textures.zombieFootballWalkingAnimated)
        actionZombieFootballDefeatedAnimation = MOptionWhistlesVsZombiesActions.factoryZombieFootballDefeatedAnimation(
            texture:textures.zombieFootballDefeatedAnimated)
    }
}
