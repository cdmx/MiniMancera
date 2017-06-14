import UIKit

class MOptionReformaCrossingLaneA:MOptionReformaCrossingLaneLeft
{
    private let kDeltaVertical:CGFloat = 160
    private let foeTypes:[MOptionReformaCrossingFoe.Type]
    
    init()
    {
        foeTypes = [
            MOptionReformaCrossingFoeVW.self,
            MOptionReformaCrossingFoeRuta2.self]
        
        super.init(deltaVertical:kDeltaVertical)
    }
    /*
    override var posibleFoes:[MOptionReformaCrossingFoe.Type]
    {
        get
        {
            return foeTypes
        }
    }*/
}
