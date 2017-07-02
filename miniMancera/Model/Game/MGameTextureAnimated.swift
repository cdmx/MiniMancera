import SpriteKit

class MGameTextureAnimated
{
    let textures:[SKTexture]
    let size:Int
    
    init(images:[UIImage])
    {
        var textures:[SKTexture] = []
        
        for image:UIImage in images
        {
            let texture:SKTexture = SKTexture(image:image)
            textures.append(texture)
        }
        
        self.textures = textures
        size = textures.count
    }
    
    init(textures:[SKTexture])
    {
        self.textures = textures
        size = textures.count
    }
}
