import UIKit

extension MOptionWhistlesVsZombiesBase
{
    private static let kResourceName:String = "ResourceWhistlesVsZombiesBase"
    private static let kResourceExtension:String = "plist"
    private static let kMarginFromTop:CGFloat = 150
    
    class func factoryItems(sceneSize:CGSize) -> [MOptionWhistlesVsZombiesBaseItem]
    {
        var items:[MOptionWhistlesVsZombiesBaseItem] = []
        let sceneWidth:CGFloat = sceneSize.width
        let sceneHeight:CGFloat = sceneSize.height
        let sceneWidth_2:CGFloat = sceneWidth / 2.0
        let positionY:CGFloat = sceneHeight - kMarginFromTop
        let positionsX:[CGFloat] = baseFromFile()
        
        for addPositionX:CGFloat in positionsX
        {
            let positionX:CGFloat = sceneWidth_2 + addPositionX
            
            let item:MOptionWhistlesVsZombiesBaseItem = MOptionWhistlesVsZombiesBaseItem(
                positionX:positionX,
                positionY:positionY)
            
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
