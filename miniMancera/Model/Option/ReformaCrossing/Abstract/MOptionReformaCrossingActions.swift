import SpriteKit

class MOptionReformaCrossingActions
{
    let actionFadeIn:SKAction
    let actionFadeOut:SKAction
    private let kFadeInDuration:TimeInterval = 0.5
    
    init()
    {
        actionFadeIn = SKAction.fadeIn(withDuration:kFadeInDuration)
        actionFadeOut = SKAction.fadeOut(withDuration:kFadeInDuration)
    }
}
