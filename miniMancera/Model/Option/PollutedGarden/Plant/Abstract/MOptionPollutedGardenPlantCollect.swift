import UIKit

class MOptionPollutedGardenPlantCollect:MGameUpdate<MOptionPollutedGarden>
{
    let positionX:CGFloat
    weak var view:VOptionPollutedGardenCollect?
    private(set) var positionY:CGFloat
    private var strategy:MGameStrategy<MOptionPollutedGardenPlantCollect, MOptionPollutedGarden>?
    private let kAddPositionY:CGFloat = 30
    
    init(plantItem:MOptionPollutedGardenPlantItem)
    {
        positionX = plantItem.positionX
        positionY = plantItem.positionY + kAddPositionY
        
        super.init()
        strategy = MOptionPollutedGardenPlantCollectStrategyWait(model:self)
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
        strategy = MOptionPollutedGardenPlantCollectStrategyFade(model:self)
    }
    
    func movePositionBy(deltaY:CGFloat)
    {
        positionY += deltaY
        view?.position = position()
    }
}
