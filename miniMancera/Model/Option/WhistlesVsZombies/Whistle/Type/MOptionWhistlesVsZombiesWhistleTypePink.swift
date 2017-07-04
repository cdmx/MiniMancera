import UIKit

class MOptionWhistlesVsZombiesWhistleTypePink:MOptionWhistlesVsZombiesWhistleType
{
    private let kSpeed:TimeInterval = 10
    private let kPower:CGFloat = 10
    
    override var textureBoard:MGameTexture?
    {
        get
        {
            return textures.whistlePinkBoard
        }
    }
    
    override var textureGame:MGameTexture?
    {
        get
        {
            return textures.whistlePinkGame
        }
    }
    
    override var titleBoard:String?
    {
        get
        {
            return String.localizedWhistlesVsZombies(
                key:"MOptionWhistlesVsZombiesWhistleTypePink_title")
        }
    }
    
    override var descrBoard:String?
    {
        get
        {
            return String.localizedWhistlesVsZombies(
                key:"MOptionWhistlesVsZombiesWhistleTypePink_descr")
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
