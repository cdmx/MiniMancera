import UIKit

extension MOptionWhistlesVsZombiesBase
{
    private static let kResourceName:String = "ResourceWhistlesVsZombiesBase"
    private static let kResourceExtension:String = "plist"
    private static let kPositionY:CGFloat = 100
    
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
