import SpriteKit

class MOptionPollutedGardenActions
{
    let actionFadeIn:SKAction
    let actionFadeOut:SKAction
    let transitionCrossFade:SKTransition
    private(set) var actionPlayerAnimation:SKAction!
    private(set) var actionBubbleAnimation:SKAction!
    private let kPlayerAnimationFrameTime:TimeInterval = 0.2
    private let kBubbleAnimationFrameTime:TimeInterval = 0.15
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
        let actionAnimation:SKAction = SKAction.animate(
            with:textureAnimated.textures,
            timePerFrame:kPlayerAnimationFrameTime,
            resize:false,
            restore:false)
        
        actionPlayerAnimation = SKAction.repeatForever(actionAnimation)
    }
    
    private func createBubbleAnimation(textureAnimated:MGameTextureAnimated)
    {
        actionBubbleAnimation = SKAction.animate(
            with:textureAnimated.textures,
            timePerFrame:kBubbleAnimationFrameTime,
            resize:false,
            restore:false)
    }
    
    //MARK: public
    
    func createAnimations(textures:MOptionPollutedGardenTextures)
    {
        createPlayerAnimation(textureAnimated:textures.playerAnimated)
        createBubbleAnimation(textureAnimated:textures.bubbleAnimated)
    }
}
