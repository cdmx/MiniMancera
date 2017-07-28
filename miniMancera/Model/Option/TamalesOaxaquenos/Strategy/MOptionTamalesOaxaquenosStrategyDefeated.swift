import Foundation

class MOptionTamalesOaxaquenosStrategyDefeated:MGameStrategyMain<MOptionTamalesOaxaquenos>
{
    private var startingTime:TimeInterval?
    private let kWait:TimeInterval = 1
    
    init(model:MOptionTamalesOaxaquenos)
    {
        let updateItems:[MGameUpdate<MOptionTamalesOaxaquenos>] = [
            model.contact,
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
        super.update(elapsedTime:elapsedTime, scene:scene)
        
        if let startingTime:TimeInterval = self.startingTime
        {
            let deltaTime:TimeInterval = elapsedTime - startingTime
            
            if deltaTime > kWait
            {
                timeOut(scene:scene)
            }
        }
        else
        {
            startingTime = elapsedTime
        }
    }
    
    //MARK: private
    
    private func timeOut(scene:ViewGameScene<MOptionTamalesOaxaquenos>)
    {
        guard
            
            let controller:COptionTamalesOaxaquenos = scene.controller as? COptionTamalesOaxaquenos
            
        else
        {
            return
        }
        
        controller.showGameOver()
    }
}
