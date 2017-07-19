import SpriteKit

class MOptionTamalesOaxaquenosActions
{
    let actionPlayerWalkingAnimation:SKAction
    let actionPlayerJumpImpulse:SKAction
    let actionPlayerDiveImpulse:SKAction
    
    init(textures:MOptionTamalesOaxaquenosTextures)
    {
        actionPlayerWalkingAnimation = MOptionTamalesOaxaquenosActions.factoryPlayerWalkingAnimation(
            texture:textures.playerWalkingAnimated)
        
        actionPlayerJumpImpulse = MOptionTamalesOaxaquenosActions.factoryPlayerJumpImpulse()
        actionPlayerDiveImpulse = MOptionTamalesOaxaquenosActions.factoryPlayerDiveImpulse()
    }
}
