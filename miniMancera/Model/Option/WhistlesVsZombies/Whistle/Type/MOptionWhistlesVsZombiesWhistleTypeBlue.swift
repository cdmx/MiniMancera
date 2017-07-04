import UIKit

class MOptionWhistlesVsZombiesWhistleTypeBlue:MOptionWhistlesVsZombiesWhistleType
{
    private let kSpeed:TimeInterval = 20
    private let kPower:CGFloat = 4
    
    override var textureBoard:MGameTexture?
    {
        get
        {
            return textures.whistleBlueBoard
        }
    }
    
    override var textureGame:MGameTexture?
    {
        get
        {
            return textures.whistleBlueGame
        }
    }
    
    override var titleBoard:String?
    {
        get
        {
            return String.localizedWhistlesVsZombies(
                key:"MOptionWhistlesVsZombiesWhistleTypeBlue_title")
        }
    }
    
    override var descrBoard:String?
    {
        get
        {
            return String.localizedWhistlesVsZombies(
                key:"MOptionWhistlesVsZombiesWhistleTypeBlue_descr")
        }
    }
    
    override var speed:TimeInterval
    {
        get
        {
            return kSpeed
        }
    }
    
    override var power:CGFloat
    {
        get
        {
            return kPower
        }
    }
}
