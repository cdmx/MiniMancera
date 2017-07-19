import SpriteKit

class MOptionTamalesOaxaquenosActions
{
    let actionPlayerWalkingAnimation:SKAction
    
    init(textures:MOptionTamalesOaxaquenosTextures)
    {
        actionPlayerWalkingAnimation = MOptionTamalesOaxaquenosActions.factoryPlayerWalkingAnimation(
            texture:textures.playerWalkingAnimated)
    }
}
