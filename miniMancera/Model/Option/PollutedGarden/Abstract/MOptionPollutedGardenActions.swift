import SpriteKit

class MOptionPollutedGardenActions
{
    let actionFadeIn:SKAction
    let actionFadeOut:SKAction
    let transitionCrossFade:SKTransition
    private(set) var actionPlayerAnimation:SKAction!
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
