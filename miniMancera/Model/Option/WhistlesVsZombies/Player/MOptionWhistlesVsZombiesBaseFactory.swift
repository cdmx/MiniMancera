import SpriteKit

extension MOptionWhistlesVsZombiesBase
{
    private static let kResourceName:String = "ResourceWhistlesVsZombiesBase"
    private static let kResourceExtension:String = "plist"
    private static let kPositionY:CGFloat = 100
    private static let kScaleFactor:CGFloat = 0.5
    private static let kAnimationDuration:TimeInterval = 0.15
    
    class func factoryItems(sceneSize:CGSize) -> [MOptionWhistlesVsZombiesBaseItem]
    {
        var items:[MOptionWhistlesVsZombiesBaseItem] = []
        let sceneWidth:CGFloat = sceneSize.width
        let sceneWidth_2:CGFloat = sceneWidth / 2.0
        let positionsX:[CGFloat] = baseFromFile()
        
        for addPositionX:CGFloat in positionsX
        {
            let positionX:CGFloat = sceneWidth_2 + addPositionX
            
            let item:MOptionWhistlesVsZombiesBaseItem = MOptionWhistlesVsZombiesBaseItem(
                positionX:positionX,
                positionY:kPositionY)
            
            items.append(item)
        }
        
        return items
    }
    
    class func factoryAnimation() -> SKAction
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
    
    //MARK: private
    
    private class func baseFromFile() -> [CGFloat]
    {
        guard
            
            let resourceBase:URL = Bundle.main.url(
                forResource:kResourceName,
                withExtension:kResourceExtension),
            let baseArray:NSArray = NSArray(
                contentsOf:resourceBase),
            let positionsX:[CGFloat] = baseArray as? [CGFloat]
            
        else
        {
            return []
        }
        
        return positionsX
    }
}
