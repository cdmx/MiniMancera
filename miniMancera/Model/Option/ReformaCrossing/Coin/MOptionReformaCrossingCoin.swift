import SpriteKit

class MOptionReformaCrossingCoin:MGameUpdateProtocol
{
    private var items:[MOptionReformaCrossingCoinItem]
    
    init()
    {
        items = []
    }
    
    //MARK: public
    
    func chargeCoinsWith(laneGroup:MOptionReformaCrossingLaneGroup)
    {
        var items:[MOptionReformaCrossingCoinItem] = []
        
        for lane:MOptionReformaCrossingLane in laneGroup.lanes
        {
            let item:MOptionReformaCrossingCoinItem = MOptionReformaCrossingCoinItem(
                positionY:lane.positionY)
            
            items.append(item)
        }
        
        self.items = items
    }
    
    //MARK: game update protocol
    
    func update(elapsedTime:TimeInterval, scene:SKScene)
    {
        for coin:MOptionReformaCrossingCoinItem in items
        {
            coin.update(elapsedTime:elapsedTime, scene:scene)
        }
    }
}
