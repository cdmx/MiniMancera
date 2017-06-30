import SpriteKit

class MOptionReformaCrossingActions
{
    var actionStopAnimation:SKAction!
    var actionPlayerWalkAnimation:SKAction!
    var actionPlayerStopAnimation:SKAction!
    let actionFadeIn:SKAction
    let actionFadeOut:SKAction
    let transitionCrossFade:SKTransition
    private let kFadeDuration:TimeInterval = 0.5
    private let kSceneTransitionDuration:TimeInterval = 1
    private let kStopAnimationFrameTime:TimeInterval = 0.03
    private let kPlayerWalkAnimationFrameTime:TimeInterval = 0.1
    private let kPlayerStopAnimationFrameTime:TimeInterval = 0.04
    
    init()
    {
        actionFadeIn = SKAction.fadeIn(withDuration:kFadeDuration)
        actionFadeOut = SKAction.fadeOut(withDuration:kFadeDuration)
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
        let actionAnimation:SKAction = SKAction.animate(
            with:textureAnimated.textures,
            timePerFrame:kPlayerWalkAnimationFrameTime,
            resize:false,
            restore:false)
        
        actionPlayerWalkAnimation = SKAction.repeatForever(actionAnimation)
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
