import Foundation

class MOptionWhistlesVsZombiesPoints:MGameUpdate<MOptionWhistlesVsZombies>
{
    private var items:[MOptionWhistlesVsZombiesPointsItem]
    
    override init()
    {
        items = []
        super.init()
    }
    
    override func update(
        elapsedTime:TimeInterval,
        scene:ViewGameScene<MOptionWhistlesVsZombies>)
    {
        for item:MOptionWhistlesVsZombiesPointsItem in items
        {
            item.update(
                elapsedTime:elapsedTime,
                scene:scene)
        }
    }
    
    //MARK: public
    
    func addPoints(zombie:MOptionWhistlesVsZombiesZombieItem)
    {
        let item:MOptionWhistlesVsZombiesPointsItem = MOptionWhistlesVsZombiesPointsItem(
            zombie:zombie)
        items.append(item)
    }
    
    func removePoints(points:MOptionWhistlesVsZombiesPointsItem)
    {
        var items:[MOptionWhistlesVsZombiesPointsItem] = []
        
        for item:MOptionWhistlesVsZombiesPointsItem in self.items
        {
            if item !== points
            {
                items.append(item)
            }
        }
        
        self.items = items
    }
}
