import UIKit

class MOptionPollutedGardenPlantCollect:MGameUpdate<MOptionPollutedGarden>
{
    weak var view:VOptionPollutedGardenCollect?
    let positionX:CGFloat
    private(set) var positionY:CGFloat
    private let kAddPositionY:CGFloat = 30
    
    init(plant:MOptionPollutedGardenPlantItem)
    {
        positionX = plant.positionX
        positionY = plant.positionY + kAddPositionY
        
        super.init()
    }
    
    //MARK: public
    
    func position() -> CGPoint
    {
        let point:CGPoint = CGPoint(x:positionX, y:positionY)
        
        return point
    }
}
