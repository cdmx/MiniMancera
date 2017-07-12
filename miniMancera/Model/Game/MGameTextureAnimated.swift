import SpriteKit

class MGameTextureAnimated
{
    let textures:[SKTexture]
    let textureSize:CGSize
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
        
        if size > 0
        {
            textureSize = textures[0].size()
        }
        else
        {
            textureSize = CGSize.zero
        }
    }
    
    init(textures:[SKTexture])
    {
        self.textures = textures
        size = textures.count
        
        if size > 0
        {
            textureSize = textures[0].size()
        }
        else
        {
            textureSize = CGSize.zero
        }
    }
}
