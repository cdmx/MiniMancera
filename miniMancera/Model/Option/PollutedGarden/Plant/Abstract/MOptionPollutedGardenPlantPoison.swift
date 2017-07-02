import UIKit

class MOptionPollutedGardenPlantPoison:MGameUpdate<MOptionPollutedGarden>
{
    let positionX:CGFloat
    weak var view:VOptionPollutedGardenPoison?
    private(set) var positionY:CGFloat
    private var strategy:MGameStrategy<MOptionPollutedGardenPlantPoison, MOptionPollutedGarden>?
    private let kAddPositionY:CGFloat = 30
    
    init(plantItem:MOptionPollutedGardenPlantItem)
    {
        positionX = plantItem.positionX
        positionY = plantItem.positionY + kAddPositionY
        
        super.init()
        strategy = MOptionPollutedGardenPlantPoisonStrategyWait(model:self)
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
    
    func position() -> CGPoint
    {
        let point:CGPoint = CGPoint(x:positionX, y:positionY)
        
        return point
    }
    
    func fade()
    {
        strategy = MOptionPollutedGardenPlantPoisonStrategyFade(model:self)
    }
    
    func movePositionBy(deltaY:CGFloat)
    {
        positionY += deltaY
        view?.position = position()
    }
}
