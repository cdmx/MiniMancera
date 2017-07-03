import SpriteKit

class MOptionWhistlesVsZombiesActions
{
    let actionFadeIn:SKAction
    let actionFadeOut:SKAction
    let actionFadeOutIn:SKAction
    let transitionCrossFade:SKTransition
    private let kFadeDuration:TimeInterval = 0.3
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
}
