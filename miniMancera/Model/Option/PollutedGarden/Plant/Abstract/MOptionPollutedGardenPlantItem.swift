import SpriteKit

class MOptionPollutedGardenPlantItem:MGameUpdateProtocol
{
    let positionX:CGFloat
    private(set) weak var textures:MOptionPollutedGardenTextures!
    
    init(textures:MOptionPollutedGardenTextures, positionX:CGFloat)
    {
        self.textures = textures
        self.positionX = positionX
    }
    
    //MARK: game update protocol
    
    func update(elapsedTime:TimeInterval, scene:SKScene)
    {
        
    }
}
