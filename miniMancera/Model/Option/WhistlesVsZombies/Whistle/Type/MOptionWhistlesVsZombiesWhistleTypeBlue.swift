import Foundation

class MOptionWhistlesVsZombiesWhistleTypeBlue:MOptionWhistlesVsZombiesWhistleType
{
    override var textureBoard:MGameTexture?
    {
        get
        {
            return textures.whistleBlueBoard
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
}
