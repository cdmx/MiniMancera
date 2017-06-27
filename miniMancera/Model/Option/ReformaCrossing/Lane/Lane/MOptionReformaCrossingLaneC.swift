import UIKit

class MOptionReformaCrossingLaneC:MOptionReformaCrossingLaneLeft
{
    private let kDeltaVertical:CGFloat = 80
    private let foeTypes:[MOptionReformaCrossingFoeItem.Type]
    
    init()
    {
        foeTypes = [MOptionReformaCrossingFoeItemVW.self,
                    MOptionReformaCrossingFoeItemRuta2.self,
                    MOptionReformaCrossingFoeItemPolice.self,
                    MOptionReformaCrossingFoeItemTaxiPink.self,
                    MOptionReformaCrossingFoeItemLordAudi.self]
        
        super.init(deltaVertical:kDeltaVertical)
    }
    
    override var possibleFoes:[MOptionReformaCrossingFoeItem.Type]
    {
        get
        {
            return foeTypes
        }
    }
}
