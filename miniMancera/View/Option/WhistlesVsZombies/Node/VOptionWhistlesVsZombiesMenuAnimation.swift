import SpriteKit

extension VOptionWhistlesVsZombiesMenu
{
    private static let kAnimationDuration:TimeInterval = 0.3
    
    class func factoryAnimationAppear() -> SKAction
    {
        let actionFadeIn:SKAction = SKAction.fadeIn(withDuration:kAnimationDuration)
        
        return actionFadeIn
    }
    
    class func factoryAnimationDisappear() -> SKAction
    {
        let actionFadeOut:SKAction = SKAction.fadeOut(withDuration:kAnimationDuration)
        
        return actionFadeOut
    }
}
