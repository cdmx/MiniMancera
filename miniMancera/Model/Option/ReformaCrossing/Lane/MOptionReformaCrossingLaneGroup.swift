import UIKit

class MOptionReformaCrossingLaneGroup
{
    let lanes:[MOptionReformaCrossingLane]
    private let countLanes:UInt32
    
    private class func factoryLanes() -> [MOptionReformaCrossingLane]
    {
        let laneA:MOptionReformaCrossingLaneA = MOptionReformaCrossingLaneA()
        let laneB:MOptionReformaCrossingLaneB = MOptionReformaCrossingLaneB()
        let laneC:MOptionReformaCrossingLaneC = MOptionReformaCrossingLaneC()
        let laneD:MOptionReformaCrossingLaneD = MOptionReformaCrossingLaneD()
        let laneE:MOptionReformaCrossingLaneE = MOptionReformaCrossingLaneE()
        let laneF:MOptionReformaCrossingLaneF = MOptionReformaCrossingLaneF()
        let laneG:MOptionReformaCrossingLaneG = MOptionReformaCrossingLaneG()
        let laneH:MOptionReformaCrossingLaneH = MOptionReformaCrossingLaneH()
        
        var lanes:[MOptionReformaCrossingLane] = [
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
        lanes = MOptionReformaCrossingLaneGroup.factoryLanes()
        countLanes = UInt32(lanes.count)
    }
    
    //MARK: public
    
    func configureForScene(size:CGSize)
    {
        for lane:MOptionReformaCrossingLane in lanes
        {
            lane.configureForScene(size:size)
        }
    }
    
    func randomLane() -> MOptionReformaCrossingLane
    {
        let random:Int = Int(arc4random_uniform(countLanes))
        let lane:MOptionReformaCrossingLane = lanes[random]
        
        return lane
    }
    
    func stopFoes()
    {
        for lane:MOptionReformaCrossingLane in lanes
        {
            lane.stopFoes()
        }
    }
    
    func playerCollectAt(position:CGPoint) -> MOptionReformaCrossingLane?
    {
        for lane:MOptionReformaCrossingLane in lanes
        {
            if lane.playerCollectAt(position:position)
            {
                return lane
            }
        }
        
        return nil
    }
}
