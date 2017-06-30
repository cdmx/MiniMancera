import SpriteKit

class MOptionReformaCrossingLaneGroup:MGameUpdate<MOptionReformaCrossing>
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
    
    override init()
    {
        lanes = MOptionReformaCrossingLaneGroup.factoryLanes()
        countLanes = UInt32(lanes.count)
        super.init()
    }
    
    override func update(
        elapsedTime:TimeInterval,
        scene:ViewGameScene<MOptionReformaCrossing>)
    {
        for lane:MOptionReformaCrossingLane in lanes
        {
            lane.update(
                elapsedTime:elapsedTime,
                scene:scene)
        }
    }
    
    //MARK: public
    
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
}
