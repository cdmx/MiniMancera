import UIKit

class MOptionReformaCrossingGameOverHitAndRun:MOptionReformaCrossingGameOverProtocol
{
    var title:String
    {
        get
        {
            return String.localizedReformaCrossing(key:"MOptionReformaCrossingGameOverHitAndRun_title")
        }
    }
    
    var descr:String
    {
        get
        {
            return String.localizedReformaCrossing(key:"MOptionReformaCrossingGameOverHitAndRun_descr")
        }
    }
    
    func texture(textures:MOptionReformaCrossingTextures) -> MGameTexture
    {
        let texture:MGameTexture = textures.playerHitAndRun
        
        return texture
    }
}
