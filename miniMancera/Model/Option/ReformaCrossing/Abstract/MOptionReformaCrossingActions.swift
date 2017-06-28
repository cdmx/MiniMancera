import SpriteKit

class MOptionReformaCrossingActions
{
    let actionFadeIn:SKAction
    let actionFadeOut:SKAction
    let transitionCrossFade:SKTransition
    var actionStopAnimation:SKAction!
    private let kFadeInDuration:TimeInterval = 0.5
    private let kSceneTransitionDuration:TimeInterval = 1
    private let kStopAnimationFrameTime:TimeInterval = 0.03
    
    init()
    {
        actionFadeIn = SKAction.fadeIn(withDuration:kFadeInDuration)
        actionFadeOut = SKAction.fadeOut(withDuration:kFadeInDuration)
        transitionCrossFade = SKTransition.crossFade(withDuration:kSceneTransitionDuration)
    }
    
    //MARK: public
    
    func createStopAnimation(textureAnimated:MGameTextureAnimated)
    {
        actionStopAnimation = SKAction.animate(
            with:textureAnimated.textures,
            timePerFrame:kStopAnimationFrameTime,
            resize:false,
            restore:false)
    }
}
