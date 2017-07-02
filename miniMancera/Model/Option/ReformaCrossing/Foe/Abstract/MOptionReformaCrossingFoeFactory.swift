import Foundation

extension MOptionReformaCrossingFoe
{
    class func randomFoe(
        model:MOptionReformaCrossing,
        lane:MOptionReformaCrossingLane) -> MOptionReformaCrossingFoeItem?
    {
        guard
            
            let foeType:MOptionReformaCrossingFoeItem.Type = foeTypeFrom(lane:lane)
            
        else
        {
            return nil
        }
        
        let foe:MOptionReformaCrossingFoeItem = foeType.init(
            model:model,
            lane:lane)
        
        return foe
    }
    
    //MARK: private
    
    private class func foeTypeFrom(lane:MOptionReformaCrossingLane) -> MOptionReformaCrossingFoeItem.Type?
    {
        let countIds:UInt32 = UInt32(lane.possibleFoes.count)
        
        if countIds > 0
        {
            let randomId:Int = Int(arc4random_uniform(countIds))
            let foeType:MOptionReformaCrossingFoeItem.Type = lane.possibleFoes[randomId]
            
            return foeType
        }
        
        return nil
    }
}
