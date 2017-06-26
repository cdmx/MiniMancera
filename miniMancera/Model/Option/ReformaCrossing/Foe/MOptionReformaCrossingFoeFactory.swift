import Foundation

extension MOptionReformaCrossingFoe
{
    class func randomFoe(
        lane:MOptionReformaCrossingLane,
        controller:COptionReformaCrossing) -> MOptionReformaCrossingFoeItem?
    {
        guard
            
            let foeType:MOptionReformaCrossingFoeItem.Type = foeTypeFrom(lane:lane)
            
        else
        {
            return nil
        }
        
        let foe:VOptionReformaCrossingFoe? = foeType.init(
            lane:lane,
            controller:controller)
        
        return foe
    }
    
    //MARK: private
    
    private class func foeTypeFrom(lane:MOptionReformaCrossingLane) -> MOptionReformaCrossingFoeItem.Type?
    {
        let possibleFoes:[VOptionReformaCrossingFoe.Type] = lane.possibleFoes
        let countIds:UInt32 = UInt32(possibleFoes.count)
        
        if countIds > 0
        {
            let randomId:Int = Int(arc4random_uniform(countIds))
            let foeType:VOptionReformaCrossingFoe.Type = possibleFoes[randomId]
            
            return foeType
        }
        
        return nil
    }
}
