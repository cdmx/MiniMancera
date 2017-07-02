import UIKit

class MOptionPollutedGardenPlantItemStrategyPop:MGameStrategy<
    MOptionPollutedGardenPlantItem,
    MOptionPollutedGarden>
{
    private var potSpeed:CGFloat?
    private var elapsedTime:TimeInterval
    private let kPotExpectedPositionY:CGFloat = 66
    private let kSpeedDivider:CGFloat = 500
    private let kMaxSpeed:UInt32 = 300
    private let kMinSpeed:UInt32 = 1
    
    override init(model:MOptionPollutedGardenPlantItem)
    {
        elapsedTime = 0
        super.init(model:model)
    }
    
    override func update(
        elapsedTime:TimeInterval,
        scene:ViewGameScene<MOptionPollutedGarden>)
    {
        if let potSpeed:CGFloat = self.potSpeed
        {
            if model.positionY < kPotExpectedPositionY
            {
                let deltaTime:TimeInterval = elapsedTime - self.elapsedTime
                let deltaY:CGFloat = CGFloat(deltaTime) * potSpeed
                model.movePotUpBy(deltaY:deltaY)
            }
            else
            {
                model.grow()
            }
        }
        else
        {
            potSpeed = randomPotSpeed()
            
            guard
            
                let scene:VOptionPollutedGardenScene = scene as? VOptionPollutedGardenScene
            
            else
            {
                return
            }
            
            scene.addPot(model:model)
        }
        
        self.elapsedTime = elapsedTime
    }
    
    //MARK: private
    
    private func randomPotSpeed() -> CGFloat
    {
        let random:UInt32 = arc4random_uniform(kMaxSpeed) + kMinSpeed
        let randomFloat:CGFloat = CGFloat(random)
        let dividedSpeed:CGFloat = randomFloat / kSpeedDivider
        
        return dividedSpeed
    }
}
