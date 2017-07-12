import UIKit

extension MOptionWhistlesVsZombiesWhistle
{
    class func factoryBases(area:MOptionWhistlesVsZombiesArea) -> [MOptionWhistlesVsZombiesWhistleBase]
    {
        var items:[MOptionWhistlesVsZombiesWhistleBase] = []
        let positions:[CGPoint] = pointsFromArea(area:area)
        
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
    
    private class func pointsFromArea(area:MOptionWhistlesVsZombiesArea) -> [CGPoint]
    {
        var points:[CGPoint] = []
        
        for positionX:CGFloat in area.base
        {
            for positionY:CGFloat in area.lane
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
