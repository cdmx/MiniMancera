import Foundation

class MOptionTamalesOaxaquenosStrategyBegin:MGameStrategyMain<MOptionTamalesOaxaquenos>
{
    private var startingTime:TimeInterval?
    private let kDuration:TimeInterval = 3
    
    init(model:MOptionTamalesOaxaquenos)
    {
        let updateItems:[MGameUpdate<MOptionTamalesOaxaquenos>] = [
            model.camera,
            model.player]
        
        super.init(
            model:model,
            updateItems:updateItems)
    }
    
    override func update(
        elapsedTime:TimeInterval,
        scene:ViewGameScene<MOptionTamalesOaxaquenos>)
    {
        super.update(
            elapsedTime:elapsedTime,
            scene:scene)
        
        if let startingTime:TimeInterval = self.startingTime
        {
            let deltaTime:TimeInterval = elapsedTime - startingTime
            
            if deltaTime > kDuration
            {
                model.strategyGame()
            }
        }
        else
        {
            startingTime = elapsedTime
        }
    }
}
