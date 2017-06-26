import SpriteKit

class MGameTexture
{
    let texture:SKTexture
    let size:CGSize
    
    init(image:UIImage)
    {
        texture = SKTexture(image:image)
        size = texture.size()
    }
}
