import SpriteKit

class MOptionPollutedGardenActions
{
    var actionPlayerAnimation:SKAction!
    let actionFadeIn:SKAction
    let actionFadeOut:SKAction
    let transitionCrossFade:SKTransition
    private let kPlayerAnimationFrameTime:TimeInterval = 0.2
    private let kFadeDuration:TimeInterval = 0.5
    private let kSceneTransitionDuration:TimeInterval = 1
    
    init()
    {
        actionFadeIn = SKAction.fadeIn(withDuration:kFadeDuration)
        actionFadeOut = SKAction.fadeOut(withDuration:kFadeDuration)
        transitionCrossFade = SKTransition.crossFade(withDuration:kSceneTransitionDuration)
    }
    
    //MARK: private
    
    private func createPlayerAnimation(textureAnimated:MGameTextureAnimated)
    {
        actionPlayerAnimation = SKAction.animate(
            with:textureAnimated.textures,
            timePerFrame:kPlayerAnimationFrameTime,
            resize:false,
            restore:false)
    }
    
    //MARK: public
    
    func createAnimations(textures:MOptionPollutedGardenTextures)
    {
        createPlayerAnimation(textureAnimated:textures.playerAnimated)
    }
}
