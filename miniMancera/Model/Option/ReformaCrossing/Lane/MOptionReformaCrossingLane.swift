import Foundation

class MOptionReformaCrossingLane
{
    let lanes:[MOptionReformaCrossingLaneProtocol]
    private let countLanes:UInt32
    
    private class func factoryLanes() -> [MOptionReformaCrossingLaneProtocol]
    {
        let laneA:MOptionReformaCrossingLaneA = MOptionReformaCrossingLaneA()
        let laneB:MOptionReformaCrossingLaneB = MOptionReformaCrossingLaneB()
        let laneC:MOptionReformaCrossingLaneC = MOptionReformaCrossingLaneC()
        let laneD:MOptionReformaCrossingLaneD = MOptionReformaCrossingLaneD()
        let laneE:MOptionReformaCrossingLaneE = MOptionReformaCrossingLaneE()
        let laneF:MOptionReformaCrossingLaneF = MOptionReformaCrossingLaneF()
        let laneG:MOptionReformaCrossingLaneG = MOptionReformaCrossingLaneG()
        let laneH:MOptionReformaCrossingLaneH = MOptionReformaCrossingLaneH()
        
        let lanes:[MOptionReformaCrossingLaneProtocol] = [
            laneA,
            laneB,
            laneC,
            laneD,
            laneE,
            laneF,
            laneG,
            laneH]
        
        return lanes
    }
    
    init()
    {
        lanes = MOptionReformaCrossingLane.factoryLanes()
        countLanes = UInt32(lanes.count)
    }
    
    //MARK: public
    
    func randomLane() -> MOptionReformaCrossingLaneProtocol
    {
        let random:Int = Int(arc4random_uniform(countLanes))
        let lane:MOptionReformaCrossingLaneProtocol = lanes[random]
        
        return lane
    }
}
