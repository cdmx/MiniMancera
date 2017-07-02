import UIKit

class MOptionReformaCrossingLaneA:MOptionReformaCrossingLaneLeft
{
    private let kDeltaVertical:CGFloat = 160
    private let foeTypes:[MOptionReformaCrossingFoeItem.Type]
    
    init()
    {
        foeTypes = [MOptionReformaCrossingFoeItemVW.self,
                    MOptionReformaCrossingFoeItemRuta2.self,
                    MOptionReformaCrossingFoeItemPolice.self,
                    MOptionReformaCrossingFoeItemTamales.self,
                    MOptionReformaCrossingFoeItemTaxiPink.self,
                    MOptionReformaCrossingFoeItemFierroViejo.self,
                    MOptionReformaCrossingFoeItemLordAudi.self,
                    MOptionReformaCrossingFoeItemCyclerFemale.self]
        
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
