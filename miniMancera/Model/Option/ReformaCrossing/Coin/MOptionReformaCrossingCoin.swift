import Foundation

class MOptionReformaCrossingCoin:MGameUpdate<MOptionReformaCrossing>
{
    private var items:[MOptionReformaCrossingCoinItem]
    
    override init()
    {
        items = []
        super.init()
    }
    
    override func update(
        elapsedTime:TimeInterval,
        scene:ViewGameScene<MOptionReformaCrossing>)
    {
        for coin:MOptionReformaCrossingCoinItem in items
        {
            coin.update(elapsedTime:elapsedTime, scene:scene)
        }
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
}
