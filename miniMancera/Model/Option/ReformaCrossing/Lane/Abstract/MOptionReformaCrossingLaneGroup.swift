import SpriteKit

class MOptionReformaCrossingLaneGroup
{
    let lanes:[MOptionReformaCrossingLane]
    private let countLanes:UInt32
    private let kSpeedMultiplier:CGFloat = 50
    
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
        
        let lanes:[MOptionReformaCrossingLane] = [
            laneH,
            laneG,
            laneF,
            laneE,
            laneD,
            laneC,
            laneB,
            laneA]
        
        return lanes
    }
    
    init()
    {
        lanes = MOptionReformaCrossingLaneGroup.factoryLanes()
        countLanes = UInt32(lanes.count)
    }
    
    //MARK: public
    
    func update(elapsedTime:TimeInterval, scene:SKScene)
    {
        for lane:MOptionReformaCrossingLane in lanes
        {
            lane.update(
                elapsedTime:elapsedTime,
                scene:scene)
        }
    }
    
    func restart(level:Int)
    {
        let addedSpeed:CGFloat = CGFloat(level) * kSpeedMultiplier
        
        for lane:MOptionReformaCrossingLane in lanes
        {
            lane.restart(addedSpeed:addedSpeed)
        }
    }
    
    func randomLane() -> MOptionReformaCrossingLane?
    {
        let random:Int = Int(arc4random_uniform(countLanes))
        let lane:MOptionReformaCrossingLane = lanes[random]
        let hasFoeWaiting:Bool = lane.hasFoeWaiting()
        
        if hasFoeWaiting
        {
            return nil
        }
        
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
