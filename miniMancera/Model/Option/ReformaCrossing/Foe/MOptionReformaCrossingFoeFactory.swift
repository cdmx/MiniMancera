import Foundation

extension MOptionReformaCrossingFoe
{
    class func randomFoe(
        lane:MOptionReformaCrossingLane,
        controller:COptionReformaCrossing) -> MOptionReformaCrossingFoe
    {
        let foe:MOptionReformaCrossingFoeVW = MOptionReformaCrossingFoeVW(
            lane:lane,
            controller:controller)
        
        return foe
    }
}
