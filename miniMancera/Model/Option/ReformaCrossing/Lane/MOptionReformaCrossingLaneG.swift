import UIKit

class MOptionReformaCrossingLaneG:MOptionReformaCrossingLaneRight
{
    private let kDeltaVertical:CGFloat = -120
    private let foeTypes:[MOptionReformaCrossingFoeItem.Type]
    
    init()
    {
        foeTypes = [MOptionReformaCrossingFoeItemVW.self,
                    MOptionReformaCrossingFoeItemRuta2.self,
                    MOptionReformaCrossingFoeItemPolice.self,
                    MOptionReformaCrossingFoeItemTaxiPink.self,
                    MOptionReformaCrossingFoeItemFierroViejo.self,
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
