import SpriteKit

class MGameTexture
{
    let texture:SKTexture
    let size:CGSize
    let width:CGFloat
    let height:CGFloat
    let width_2:CGFloat
    let height_2:CGFloat
    let zPosition:CGFloat
    
    init(image:UIImage, zPosition:CGFloat)
    {
        texture = SKTexture(image:image)
        size = texture.size()
        width = size.width
        height = size.height
        width_2 = width / 2.0
        height_2 = height / 2.0
        self.zPosition = zPosition
    }
}
