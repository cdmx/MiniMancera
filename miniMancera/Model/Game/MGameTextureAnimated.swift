import SpriteKit

class MGameTextureAnimated
{
    let textures:[SKTexture]
    
    init(images:[UIImage])
    {
        var textures:[SKTexture] = []
        
        for image:UIImage in images
        {
            let texture:SKTexture = SKTexture(image:image)
            textures.append(texture)
        }
        
        self.textures = textures
    }
}
