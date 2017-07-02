import UIKit

class MOptionPollutedGardenPlantItem:MGameUpdate<MOptionPollutedGarden>
{
    let positionX:CGFloat
    weak var viewPot:VOptionPollutedGardenPot?
    weak var viewPlant:VOptionPollutedGardenPlant?
    private(set) weak var animations:MOptionPollutedGardenPlantAnimations!
    private(set) var positionY:CGFloat
    private var strategy:MGameStrategy<MOptionPollutedGardenPlantItem, MOptionPollutedGarden>?
    private let kPositionY:CGFloat = 45
    
    init(animations:MOptionPollutedGardenPlantAnimations, positionX:CGFloat)
    {
        self.animations = animations
        self.positionX = positionX
        positionY = kPositionY
        super.init()
        
        strategy = MOptionPollutedGardenPlantItemStrategyPop(model:self)
    }
    
    override func update(
        elapsedTime:TimeInterval,
        scene:ViewGameScene<MOptionPollutedGarden>)
    {
        strategy?.update(
            elapsedTime:elapsedTime,
            scene:scene)
    }
    
    //MARK: public
    
    func collectFlower(scene:ViewGameScene<MOptionPollutedGarden>)
    {
        scene.controller.model.collectedFlower(plantItem:self)
    }
    
    func grow()
    {
        strategy = MOptionPollutedGardenPlantItemStrategyGrow(model:self)
    }
    
    func collect()
    {
        strategy = MOptionPollutedGardenPlantItemStrategyCollect(model:self)
    }
    
    func polluted()
    {
        strategy = MOptionPollutedGardenPlantItemStrategyPolluted(model:self)
    }
    
    func movePotUpBy(deltaY:CGFloat)
    {
        positionY += deltaY
        viewPot?.position = potPosition()
    }
    
    func potPosition() -> CGPoint
    {
        let point:CGPoint = CGPoint(x:positionX, y:positionY)
        
        return point
    }
    
    func pollutable() -> Bool
    {
        guard
        
            let _:MOptionPollutedGardenPlantItemStrategyPolluted = strategy as? MOptionPollutedGardenPlantItemStrategyPolluted
        
        else
        {
            return true
        }
        
        return false
    }
}
