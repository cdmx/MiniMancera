import SpriteKit

extension MOptionWhistlesVsZombiesMenu
{
    private static let kPositionX:CGFloat = 0
    private static let kInitialPositionY:CGFloat = 150
    private static let kDeltaYPosition:CGFloat = -100
    private static let kScaleFactor:CGFloat = 0.75
    private static let kAnimationDuration:TimeInterval = 0.15
    
    class func factoryItems(sceneSize:CGSize) -> [MOptionWhistlesVsZombiesMenuItem]
    {
        let sceneHeight:CGFloat = sceneSize.height
        let sceneHeight_2:CGFloat = sceneHeight / 2.0
        var whistlePositionY:CGFloat = sceneHeight_2 - kInitialPositionY
        
        let itemPink:MOptionWhistlesVsZombiesMenuItemPink = MOptionWhistlesVsZombiesMenuItemPink(
            positionX:kPositionX,
            positionY:whistlePositionY)
        
        whistlePositionY += kDeltaYPosition
        
        let itemBlue:MOptionWhistlesVsZombiesMenuItemBlue = MOptionWhistlesVsZombiesMenuItemBlue(
            positionX:kPositionX,
            positionY:whistlePositionY)
        
        whistlePositionY += kDeltaYPosition
        
        let itemOrange:MOptionWhistlesVsZombiesMenuItemOrange = MOptionWhistlesVsZombiesMenuItemOrange(
            positionX:kPositionX,
            positionY:whistlePositionY)
        
        let items:[MOptionWhistlesVsZombiesMenuItem] = [
            itemPink,
            itemBlue,
            itemOrange]
        
        return items
    }
    
    class func factoryWhistleAnimation() -> SKAction
    {
        let actionShrink:SKAction = SKAction.scale(
            to:kScaleFactor,
            duration:kAnimationDuration)
        let actionRestore:SKAction = SKAction.scale(
            to:1,
            duration:kAnimationDuration)
        let actions:[SKAction] = [
            actionShrink,
            actionRestore]
        let actionsSequence:SKAction = SKAction.sequence(actions)
        
        return actionsSequence
    }
}
