import Foundation

class MOptionWhistlesVsZombiesWhistleTypePink:MOptionWhistlesVsZombiesWhistleType
{
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
}
