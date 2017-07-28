import SpriteKit

class MOptionTamalesOaxaquenosActions
{
    let actionFadeIn:SKAction
    let actionFadeOut:SKAction
    let actionFadeOutIn:SKAction
    let actionPlayerWalkingAnimation:SKAction
    let transitionCrossFade:SKTransition
    private let kFadeDuration:TimeInterval = 0.3
    private let kSceneTransitionDuration:TimeInterval = 1
    
    init(textures:MOptionTamalesOaxaquenosTextures)
    {
        actionFadeIn = SKAction.fadeIn(withDuration:kFadeDuration)
        actionFadeOut = SKAction.fadeOut(withDuration:kFadeDuration)
        
        let sequenceOutIn:[SKAction] = [
            actionFadeOut,
            actionFadeIn]
        actionFadeOutIn = SKAction.sequence(sequenceOutIn)
        
        transitionCrossFade = SKTransition.crossFade(withDuration:kSceneTransitionDuration)
        
        actionPlayerWalkingAnimation = MOptionTamalesOaxaquenosActions.factoryPlayerWalkingAnimation(
            texture:textures.playerWalkingAnimated)
    }
}
