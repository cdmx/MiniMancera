import SpriteKit

class MOptionReformaCrossingActions
{
    let actionFadeIn:SKAction
    let actionFadeOut:SKAction
    let transitionCrossFade:SKTransition
    private let kFadeInDuration:TimeInterval = 0.5
    private let kSceneTransitionDuration:TimeInterval = 1
    
    init()
    {
        actionFadeIn = SKAction.fadeIn(withDuration:kFadeInDuration)
        actionFadeOut = SKAction.fadeOut(withDuration:kFadeInDuration)
        transitionCrossFade = SKTransition.crossFade(withDuration:kSceneTransitionDuration)
    }
}
