import SpriteKit

class MOptionWhistlesVsZombiesMenuItem
{
    let positionX:CGFloat
    let positionY:CGFloat
    private(set) var texture:SKTexture?
    private(set) var textureSize:CGSize
    
    init(positionX:CGFloat, positionY:CGFloat)
    {
        self.positionX = positionX
        self.positionY = positionY
        textureSize = CGSize.zero
    }
}
