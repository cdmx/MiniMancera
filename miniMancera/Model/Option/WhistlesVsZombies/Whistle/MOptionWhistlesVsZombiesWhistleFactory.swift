import UIKit

extension MOptionWhistlesVsZombiesWhistle
{
    private static let kResourceName:String = "ResourceWhistlesVsZombiesBase"
    private static let kResourceExtension:String = "plist"
    
    class func factoryBases() -> [MOptionWhistlesVsZombiesWhistleBase]
    {
        var items:[MOptionWhistlesVsZombiesWhistleBase] = []
        let sceneWidth:CGFloat = MGame.sceneSize.width
        let sceneWidth_2:CGFloat = sceneWidth / 2.0
        let positionsX:[CGFloat] = positionsFromFile()
        
        for addPositionX:CGFloat in positionsX
        {
            let positionX:CGFloat = sceneWidth_2 + addPositionX
            let item:MOptionWhistlesVsZombiesWhistleBase = MOptionWhistlesVsZombiesWhistleBase(
                positionX:positionX)
            
            items.append(item)
        }
        
        return items
    }
    
    //MARK: private
    
    private class func positionsFromFile() -> [CGFloat]
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
