import SpriteKit

class MOptionPollutedGardenBubbleItemStrategyExploded:MGameStrategy<
    MOptionPollutedGardenBubbleItem,
    MOptionPollutedGarden>
{
    private var startingTime:TimeInterval?
    private let kDuration:TimeInterval = 1.5
    
    override func update(
        elapsedTime:TimeInterval,
        scene:ViewGameScene<MOptionPollutedGarden>)
    {
        if let startingTime:TimeInterval = self.startingTime
        {
            let deltaTime:TimeInterval = elapsedTime - startingTime
            
            if deltaTime > kDuration
            {
                model.view?.explodeEnded()
                scene.controller.model.bubble.bubbleExplodeFinished(
                    bubbleItem:model)
            }
        }
        else
        {
            startingTime = elapsedTime
            let explodeAnimation:SKAction = scene.controller.model.actions.actionBubbleAnimation
            model.view?.explodeStart(animation:explodeAnimation)
            
            guard
            
                let scene:VOptionPollutedGardenScene = scene as? VOptionPollutedGardenScene
            
            else
            {
                return
            }
            
            scene.bubbleExploded()
        }
    }
}
