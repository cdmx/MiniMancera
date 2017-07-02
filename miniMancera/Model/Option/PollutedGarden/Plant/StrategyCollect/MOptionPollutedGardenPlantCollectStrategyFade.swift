import UIKit

class MOptionPollutedGardenPlantCollectStrategyFade:MGameStrategy<
    MOptionPollutedGardenPlantCollect,
    MOptionPollutedGarden>
{
    private var lastElapsedTime:TimeInterval?
    private var alpha:CGFloat = 1
    private let kMoveSpeed:CGFloat = 45
    private let kAlphaDecreaseSpeed:CGFloat = 0.6
    
    override func update(
        elapsedTime:TimeInterval,
        scene:ViewGameScene<MOptionPollutedGarden>)
    {
        if let lastElapsedTime:TimeInterval = self.lastElapsedTime
        {
            if alpha > 0
            {
                let deltaTime:TimeInterval = elapsedTime - lastElapsedTime
                self.lastElapsedTime = elapsedTime
                updateView(deltaTime:deltaTime)
            }
            else
            {
                model.view?.removeFromParent()
                scene.controller.model.plant.collectFinished(collectItem:model)
            }
        }
        else
        {
            lastElapsedTime = elapsedTime
        }
    }
    
    //MAKR: private
    
    private func updateView(deltaTime:TimeInterval)
    {
        let deltaTimeFloat:CGFloat = CGFloat(deltaTime)
        let deltaAlpha:CGFloat = kAlphaDecreaseSpeed * deltaTimeFloat
        let deltaPositionY:CGFloat = kMoveSpeed * deltaTimeFloat
        alpha -= deltaAlpha
        
        model.movePositionBy(deltaY:deltaPositionY)
        model.view?.alpha = alpha
    }
}
