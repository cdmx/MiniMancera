import UIKit

extension MOptionWhistlesVsZombiesWhistle
{
    private static let kResourceName:String = "ResourceWhistlesVsZombiesBase"
    private static let kResourceExtension:String = "plist"
    private static let kKeyX:String = "x"
    private static let kKeyY:String = "y"
    
    class func factoryBases() -> [MOptionWhistlesVsZombiesWhistleBase]
    {
        var items:[MOptionWhistlesVsZombiesWhistleBase] = []
        let positions:[CGPoint] = positionsFromFile()
        
        for position:CGPoint in positions
        {
            let item:MOptionWhistlesVsZombiesWhistleBase = MOptionWhistlesVsZombiesWhistleBase(
                position:position)
            
            items.append(item)
        }
        
        return items
    }
    
    class func factoryTypes(textures:MOptionWhistlesVsZombiesTextures) -> [MOptionWhistlesVsZombiesWhistleTypeProtocol]
    {
        let itemPink:MOptionWhistlesVsZombiesWhistleTypePink = MOptionWhistlesVsZombiesWhistleTypePink(
            textures:textures)
        let itemBlue:MOptionWhistlesVsZombiesWhistleTypeBlue = MOptionWhistlesVsZombiesWhistleTypeBlue(
            textures:textures)
        let itemOrange:MOptionWhistlesVsZombiesWhistleTypeOrange = MOptionWhistlesVsZombiesWhistleTypeOrange(
            textures:textures)
        
        let items:[MOptionWhistlesVsZombiesWhistleTypeProtocol] = [
            itemPink,
            itemBlue,
            itemOrange]
        
        return items
    }
    
    //MARK: private
    
    private class func positionsFromFile() -> [CGPoint]
    {
        guard
            
            let resourceBase:URL = Bundle.main.url(
                forResource:kResourceName,
                withExtension:kResourceExtension),
            let baseDictionary:NSDictionary = NSDictionary(
                contentsOf:resourceBase),
            let map:[String:[CGFloat]] = baseDictionary as? [String:[CGFloat]]
            
        else
        {
            return []
        }
        
        let points:[CGPoint] = pointsFromMap(map:map)
        
        return points
    }
    
    private class func pointsFromMap(map:[String:[CGFloat]]) -> [CGPoint]
    {
        var points:[CGPoint] = []
        
        guard
        
            let arrayX:[CGFloat] = map[kKeyX],
            let arrayY:[CGFloat] = map[kKeyY]
        
        else
        {
            return points
        }
        
        let sceneWidth:CGFloat = MGame.sceneSize.width
        let sceneWidth_2:CGFloat = sceneWidth / 2.0
        
        for addPositionX:CGFloat in arrayX
        {
            let positionX:CGFloat = sceneWidth_2 + addPositionX
            
            for positionY:CGFloat in arrayY
            {
                let point:CGPoint = CGPoint(
                    x:positionX,
                    y:positionY)
                points.append(point)
            }
        }
        
        return points
    }
}
