import SpriteKit

class MOptionWhistlesVsZombiesMenuItemPink:MOptionWhistlesVsZombiesMenuItem
{
    private let internalWhistleType:MOptionWhistlesVsZombiesWhistlePink.Type
    private let internalWhistleTextures:MOptionWhistlesVsZombiesWhistleTextures
    private let internalTexture:SKTexture
    private let internalSize:CGSize
    
    override var whistleType:MOptionWhistlesVsZombiesWhistle.Type?
    {
        get
        {
            return internalWhistleType
        }
    }
    
    override var whistleTextures:MOptionWhistlesVsZombiesWhistleTextures?
    {
        get
        {
            return internalWhistleTextures
        }
    }
    
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
            return String.localizedWhistlesVsZombies(key:"MOptionWhistlesVsZombiesMenuItemPink_title")
        }
    }
    
    override var descr:String?
    {
        get
        {
            return String.localizedWhistlesVsZombies(key:"MOptionWhistlesVsZombiesMenuItemPink_descr")
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
        internalWhistleType = MOptionWhistlesVsZombiesWhistlePink.self
        internalWhistleTextures = MOptionWhistlesVsZombiesWhistleTextures(
            stand:#imageLiteral(resourceName: "assetWhistlesVsZombiesWhistlePinkStand"))
        internalTexture = SKTexture(image:#imageLiteral(resourceName: "assetWhistlesVsZombiesWhistlePinkHorizontal"))
        internalSize = internalTexture.size()
        
        super.init(positionX:positionX, positionY:positionY)
    }
}
