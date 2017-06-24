import SpriteKit

class MOptionWhistlesVsZombiesWhistleTextures
{
    let stand:SKTexture
    let standSize:CGSize
    
    init(stand:UIImage)
    {
        self.stand = SKTexture(image:stand)
        standSize = self.stand.size()
    }
}
