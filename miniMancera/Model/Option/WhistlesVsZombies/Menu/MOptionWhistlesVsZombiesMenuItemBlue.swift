import SpriteKit

class MOptionWhistlesVsZombiesMenuItemBlue:MOptionWhistlesVsZombiesMenuItem
{
    private let internalTexture:SKTexture
    private let internalSize:CGSize
    
    override var texture:SKTexture?
    {
        get
        {
            return internalTexture
        }
    }
    
    override var title:String?
    {
        get
        {
            return String.localizedWhistlesVsZombies(key:"MOptionWhistlesVsZombiesMenuItemBlue_title")
        }
    }
    
    override var descr:String?
    {
        get
        {
            return String.localizedWhistlesVsZombies(key:"MOptionWhistlesVsZombiesMenuItemOrange_descr")
        }
    }
    
    override var textureSize:CGSize
    {
        get
        {
            return internalSize
        }
    }
    
    override init(positionX:CGFloat, positionY:CGFloat)
    {
        internalTexture = SKTexture(image:#imageLiteral(resourceName: "assetWhistlesVsZombiesWhistleBlueHorizontal"))
        internalSize = internalTexture.size()
        
        super.init(positionX:positionX, positionY:positionY)
    }
}
