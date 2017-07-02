import SpriteKit

class MOptionPollutedGardenPlantAnimations
{
    private(set) var animationsPlantGrow:[SKAction]
    private var animationPlantPoisoned:SKAction?
    
    private class func factoryAnimations(actions:MOptionPollutedGardenActions) -> [SKAction]
    {
        var animations:[SKAction] = []
        let textures:[SKTexture] = allTextures()
        let actionFadeOut:SKAction = actions.actionFadeOut
        let actionFadeIn:SKAction = actions.actionFadeIn
        
        for texture:SKTexture in textures
        {
            let actionTexture:SKAction = SKAction.setTexture(texture, resize:false)
            let actions:[SKAction] = [
                actionFadeOut,
                actionTexture,
                actionFadeIn]
            let actionsSequence:SKAction = SKAction.sequence(actions)
            
            animations.append(actionsSequence)
        }
        
        return animations
    }
    
    private class func factoryAnimationPoisoned(
        actions:MOptionPollutedGardenActions,
        textures:MOptionPollutedGardenTextures) -> SKAction
    {
        let texture:SKTexture = textures.plantPoisoned.texture
        let actionFadeOut:SKAction = actions.actionFadeOut
        let actionFadeIn:SKAction = actions.actionFadeIn
        
        let actionTexture:SKAction = SKAction.setTexture(texture, resize:false)
        let actions:[SKAction] = [
            actionFadeOut,
            actionTexture,
            actionFadeIn]
        let actionsSequence:SKAction = SKAction.sequence(actions)
        
        return actionsSequence
    }
    
    private class func allTextures() -> [SKTexture]
    {
        var textures:[SKTexture] = []
        let images:[UIImage] = allImages()
        
        for image:UIImage in images
        {
            let texture:SKTexture = SKTexture(image:image)
            textures.append(texture)
        }
        
        return textures
    }
    
    private class func allImages() -> [UIImage]
    {
        let images:[UIImage] = [
            #imageLiteral(resourceName: "assetPollutedGardenPetunia0"),
            #imageLiteral(resourceName: "assetPollutedGardenPetunia1"),
            #imageLiteral(resourceName: "assetPollutedGardenPetunia2"),
            #imageLiteral(resourceName: "assetPollutedGardenPetunia3"),
            #imageLiteral(resourceName: "assetPollutedGardenPetunia4"),
            #imageLiteral(resourceName: "assetPollutedGardenPetunia5"),
            #imageLiteral(resourceName: "assetPollutedGardenPetunia6"),
            #imageLiteral(resourceName: "assetPollutedGardenPetunia7"),
            #imageLiteral(resourceName: "assetPollutedGardenPetunia8"),
            #imageLiteral(resourceName: "assetPollutedGardenPetunia9"),
            #imageLiteral(resourceName: "assetPollutedGardenPetunia10"),
            #imageLiteral(resourceName: "assetPollutedGardenPetunia11")]
        
        return images
    }
    
    init()
    {
        animationsPlantGrow = []
    }
    
    //MARK: public
    
    func factoryAnimations(
        actions:MOptionPollutedGardenActions,
        textures:MOptionPollutedGardenTextures)
    {
        animationsPlantGrow = MOptionPollutedGardenPlantAnimations.factoryAnimations(
            actions:actions)
        animationPlantPoisoned = MOptionPollutedGardenPlantAnimations.factoryAnimationPoisoned(
            actions:actions,
            textures:textures)
    }
}
