import UIKit

extension MOptionWhistlesVsZombies
{
    private static let kResourceName:String = "ResourceWhistlesVsZombiesArea"
    private static let kResourceExtension:String = "plist"
    private static let kKeyBase:String = "base"
    private static let kKeyLane:String = "lane"
    
    class func loadArea() -> MOptionWhistlesVsZombiesArea
    {
        let area:MOptionWhistlesVsZombiesArea
        
        guard
            
            let resourceBase:URL = Bundle.main.url(
                forResource:kResourceName,
                withExtension:kResourceExtension),
            let areaDictionary:NSDictionary = NSDictionary(
                contentsOf:resourceBase),
            let map:[String:AnyObject] = areaDictionary as? [String:AnyObject],
            let mapLane:[CGFloat] = map[kKeyLane] as? [CGFloat],
            let mapBase:[CGFloat] = map[kKeyBase] as? [CGFloat]
            
        else
        {
            area = MOptionWhistlesVsZombiesArea(lane:[], base:[])
            
            return area
        }
        
        area = MOptionWhistlesVsZombiesArea(lane:mapLane, base:mapBase)

        return area
    }
}
