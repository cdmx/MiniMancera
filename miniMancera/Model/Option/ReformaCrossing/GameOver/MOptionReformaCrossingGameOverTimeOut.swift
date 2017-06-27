import UIKit

class MOptionReformaCrossingGameOverTimeOut:MOptionReformaCrossingGameOverProtocol
{
    var title:String
    {
        get
        {
            return String.localizedReformaCrossing(key:"MOptionReformaCrossingGameOverTimeOut_title")
        }
    }
    
    var descr:String
    {
        get
        {
            return String.localizedReformaCrossing(key:"MOptionReformaCrossingGameOverTimeOut_descr")
        }
    }
    
    func texture(textures:MOptionReformaCrossingTextures) -> MGameTexture
    {
        let texture:MGameTexture = textures.playerTimeout
        
        return texture
    }
}
