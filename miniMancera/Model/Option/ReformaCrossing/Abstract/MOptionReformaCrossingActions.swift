import SpriteKit

class MOptionReformaCrossingActions
{
    let actionFadeIn:SKAction
    private let kFadeInDuration:TimeInterval = 0.5
    
    init()
    {
        actionFadeIn = SKAction.fadeIn(withDuration:kFadeInDuration)
    }
}
