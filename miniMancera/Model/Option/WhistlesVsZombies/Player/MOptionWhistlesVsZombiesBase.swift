import UIKit

class MOptionWhistlesVsZombiesBase
{
    private(set) var items:[MOptionWhistlesVsZombiesBaseItem]
    private static let kResourceName:String = "ResourceWhistlesVsZombiesBase"
    private static let kResourceExtension:String = "plist"
    private static let kMarginFromTop:CGFloat = 100
    
    class func factoryItems(sceneSize:CGSize) -> [MOptionWhistlesVsZombiesBaseItem]
    {
        var items:[MOptionWhistlesVsZombiesBaseItem] = []
        let sceneHeight:CGFloat = sceneSize.height
        let positionY:CGFloat = sceneHeight - kMarginFromTop
        let positionsX:[CGFloat] = baseFromFile()
        
        for positionX:CGFloat in positionsX
        {
            let item:MOptionWhistlesVsZombiesBaseItem = MOptionWhistlesVsZombiesBaseItem(
                positionX:positionsX,
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
    
    init()
    {
        items = []
    }
    
    //MARK: public
    
    func createItems(sceneSize:CGSize)
    {
        
    }
}
