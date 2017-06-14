import Foundation

extension MOptionReformaCrossingFoe
{
    class func randomFoe(
        lane:MOptionReformaCrossingLane,
        controller:COptionReformaCrossing) -> MOptionReformaCrossingFoe
    {
        let possibleFoes:[MOptionReformaCrossingFoe.Id] = lane.posibleFoes
        
        
        
        let foe:MOptionReformaCrossingFoeVW = MOptionReformaCrossingFoeVW(
            lane:lane,
            controller:controller)
        
        return foe
    }
    
    //MARK: private
    
    private class func foeIdFrom(lane:MOptionReformaCrossingLane) -> MOptionReformaCrossingFoe.Id
    {
        let possibleFoes:[MOptionReformaCrossingFoe.Id] = lane.posibleFoes
        let countIds:UInt32 = UInt32(possibleFoes.count)
        let randomId:Int = Int(arc4random_uniform(countIds))
        let foeId:MOptionReformaCrossingFoe.Id = possibleFoes[randomId]
        
        return foeId
    }
}
