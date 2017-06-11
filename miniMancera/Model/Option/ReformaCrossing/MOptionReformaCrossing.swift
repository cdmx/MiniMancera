import UIKit
import SpriteKit

class MOptionReformaCrossing:MOptionProtocol
{
    let lanes:[MOptionReformaCrossingLaneProtocol]
    
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
        lanes = MOptionReformaCrossing.factoryLanes()
    }
    
    //MARK: option protocol
    
    func sceneWithSize(size:CGSize) -> SKScene
    {
        let scene:MOptionReformaCrossingScene = MOptionReformaCrossingScene(size:size)
        
        return scene
    }
}
