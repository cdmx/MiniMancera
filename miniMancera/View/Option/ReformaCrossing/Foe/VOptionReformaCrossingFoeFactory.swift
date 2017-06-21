import Foundation

extension VOptionReformaCrossingFoe
{
    class func randomFoe(
        lane:MOptionReformaCrossingLane,
        controller:COptionReformaCrossing) -> VOptionReformaCrossingFoe?
    {
        guard
            
            let foeType:MOptionReformaCrossingFoe.Type = foeTypeFrom(lane:lane)
            
            else
        {
            return nil
        }
        
        let foe:MOptionReformaCrossingFoe? = foeType.init(
            lane:lane,
            controller:controller)
        
        return foe
    }
    
    //MARK: private
    
    private class func foeTypeFrom(lane:MOptionReformaCrossingLane) -> MOptionReformaCrossingFoe.Type?
    {
        let possibleFoes:[MOptionReformaCrossingFoe.Type] = lane.posibleFoes
        let countIds:UInt32 = UInt32(possibleFoes.count)
        
        if countIds > 0
        {
            let randomId:Int = Int(arc4random_uniform(countIds))
            let foeType:MOptionReformaCrossingFoe.Type = possibleFoes[randomId]
            
            return foeType
        }
        
        return nil
    }
}
