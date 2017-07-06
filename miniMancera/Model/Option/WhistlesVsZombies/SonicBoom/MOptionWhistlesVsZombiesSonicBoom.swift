import Foundation

class MOptionWhistlesVsZombiesSonicBoom:MGameUpdate<MOptionWhistlesVsZombies>
{
    private(set) var items:[MOptionWhistlesVsZombiesSonicBoomItem]
    
    override init()
    {
        items = []
        super.init()
    }
    
    override func update(
        elapsedTime:TimeInterval,
        scene:ViewGameScene<MOptionWhistlesVsZombies>)
    {
        for item:MOptionWhistlesVsZombiesSonicBoomItem in items
        {
            item.update(
                elapsedTime:elapsedTime,
                scene:scene)
        }
    }
    
    //MARK: public
    
    func release(
        base:MOptionWhistlesVsZombiesWhistleBase,
        whistleType:MOptionWhistlesVsZombiesWhistleTypeProtocol)
    {
        let item:MOptionWhistlesVsZombiesSonicBoomItem = MOptionWhistlesVsZombiesSonicBoomItem(
            base:base,
            whistleType:whistleType)
        items.append(item)
    }
    
    func collisionFinish(boomItem:MOptionWhistlesVsZombiesSonicBoomItem)
    {
        var items:[MOptionWhistlesVsZombiesSonicBoomItem] = []
        
        for item:MOptionWhistlesVsZombiesSonicBoomItem in self.items
        {
            if item !== boomItem
            {
                items.append(item)
            }
        }
        
        self.items = items
    }
}
