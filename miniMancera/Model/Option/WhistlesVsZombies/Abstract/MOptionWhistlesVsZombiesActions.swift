import SpriteKit

class MOptionWhistlesVsZombiesActions
{
    let actionFadeIn:SKAction
    let actionFadeOut:SKAction
    let actionFadeOutIn:SKAction
    let transitionCrossFade:SKTransition
    private(set) var actionSonicReleaseAnimation:SKAction!
    private let kFadeDuration:TimeInterval = 0.3
    private let kSonicReleaseFrameDuration:TimeInterval = 0.1
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
    
    //MARK: private
    
    private func factorySonicReleaseAnimation(texture:MGameTextureAnimated)
    {
        actionSonicReleaseAnimation = SKAction.animate(
            with:texture.textures,
            timePerFrame:kSonicReleaseFrameDuration,
            resize:false,
            restore:false)
    }
    
    //MARK: public
    
    func factoryAnimations(textures:MOptionWhistlesVsZombiesTextures)
    {
        factorySonicReleaseAnimation(texture:textures.sonicReleaseAnimated)
    }
}
