import SpriteKit

class MOptionWhistlesVsZombiesMenuItem
{
    let positionX:CGFloat
    let positionY:CGFloat
    private(set) var whistleType:MOptionWhistlesVsZombiesWhistle.Type?
    private(set) var whistleTextures:MOptionWhistlesVsZombiesWhistleTextures?
    private(set) var texture:SKTexture?
    private(set) var title:String?
    private(set) var descr:String?
    private(set) var textureSize:CGSize
    
    init(positionX:CGFloat, positionY:CGFloat)
    {
        self.positionX = positionX
        self.positionY = positionY
        textureSize = CGSize.zero
    }

    //MARK: final
    
    final func factoryWhistle() -> MOptionWhistlesVsZombiesWhistle?
    {
        guard
        
            let whistleType:MOptionWhistlesVsZombiesWhistle.Type = self.whistleType,
            let whistleTextures:MOptionWhistlesVsZombiesWhistleTextures = self.whistleTextures
        
        else
        {
            return nil
        }
        
        let whistle:MOptionWhistlesVsZombiesWhistle = whistleType.init(
            textures:whistleTextures)
        
        return whistle
    }
}
