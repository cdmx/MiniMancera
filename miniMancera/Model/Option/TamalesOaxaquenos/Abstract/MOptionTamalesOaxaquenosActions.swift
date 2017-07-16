import SpriteKit

class MOptionTamalesOaxaquenosActions
{
    let actionPlayerWalkingAnimation:SKAction
    
    init(textures:MOptionTamalesOaxaquenosTextures)
    {
        actionPlayerWalkingAnimation = MOptionTamalesOaxaquenosActions.factoryPlayerWalkingnimation(
            texture:textures.playerWalkingAnimated)
    }
}
