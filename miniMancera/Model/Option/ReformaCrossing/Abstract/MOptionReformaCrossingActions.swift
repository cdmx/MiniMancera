import SpriteKit

class MOptionReformaCrossingActions
{
    let actionFadeIn:SKAction
    let actionFadeOut:SKAction
    let transitionCrossFade:SKTransition
    var actionStopAnimation:SKAction!
    var actionPlayerWalkAnimation:SKAction!
    var actionPlayerStopAnimation:SKAction!
    private let kFadeInDuration:TimeInterval = 0.5
    private let kSceneTransitionDuration:TimeInterval = 1
    private let kStopAnimationFrameTime:TimeInterval = 0.03
    private let kPlayerWalkAnimationFrameTime:TimeInterval = 0.1
    private let kPlayerStopAnimationFrameTime:TimeInterval = 0.04
    
    init()
    {
        actionFadeIn = SKAction.fadeIn(withDuration:kFadeInDuration)
        actionFadeOut = SKAction.fadeOut(withDuration:kFadeInDuration)
        transitionCrossFade = SKTransition.crossFade(withDuration:kSceneTransitionDuration)
    }
    
    //MARK: private
    
    private func createStopAnimation(textureAnimated:MGameTextureAnimated)
    {
        actionStopAnimation = SKAction.animate(
            with:textureAnimated.textures,
            timePerFrame:kStopAnimationFrameTime,
            resize:false,
            restore:false)
    }
    
    private func createPlayerWalkAnimation(textureAnimated:MGameTextureAnimated)
    {
        actionPlayerWalkAnimation = SKAction.animate(
            with:textureAnimated.textures,
            timePerFrame:kPlayerWalkAnimationFrameTime,
            resize:false,
            restore:false)
    }
    
    private func createPlayerStopAnimation(textureAnimated:MGameTextureAnimated)
    {
        actionPlayerStopAnimation = SKAction.animate(
            with:textureAnimated.textures,
            timePerFrame:kPlayerStopAnimationFrameTime,
            resize:false,
            restore:false)
    }
    
    //MARK: public
    
    func createAnimations(textures:MOptionReformaCrossingTextures)
    {
        createStopAnimation(textureAnimated:textures.stopAnimated)
        createPlayerWalkAnimation(textureAnimated:textures.playerAnimatedWalk)
        createPlayerStopAnimation(textureAnimated:textures.playerAnimatedStop)
    }
}
