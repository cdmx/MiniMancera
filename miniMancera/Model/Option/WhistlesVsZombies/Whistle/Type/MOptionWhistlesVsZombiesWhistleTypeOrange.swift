import Foundation

class MOptionWhistlesVsZombiesWhistleTypeOrange:MOptionWhistlesVsZombiesWhistleType
{
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
}
