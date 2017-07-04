import UIKit

class MOptionWhistlesVsZombiesWhistleTypeOrange:MOptionWhistlesVsZombiesWhistleType
{
    private let kSpeed:CGFloat = 5
    private let kPower:CGFloat = 13
    
    override var textureBoard:MGameTexture?
    {
        get
        {
            return textures.whistleOrangeBoard
        }
    }
    
    override var textureGame:MGameTexture?
    {
        get
        {
            return textures.whistleOrangeGame
        }
    }
    
    override var titleBoard:String?
    {
        get
        {
            return String.localizedWhistlesVsZombies(
                key:"MOptionWhistlesVsZombiesWhistleTypeOrange_title")
        }
    }
    
    override var descrBoard:String?
    {
        get
        {
            return String.localizedWhistlesVsZombies(
                key:"MOptionWhistlesVsZombiesWhistleTypeOrange_descr")
        }
    }
    
    override var speed:CGFloat
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
