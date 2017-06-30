import Foundation

class MOptionReformaCrossingStrategyEnd:MGameStrategyMain<MOptionReformaCrossing>
{
    private var initialTime:TimeInterval?
    private let keepAdvancing:Bool
    private let kWait:TimeInterval = 1.5
    
    init(model:MOptionReformaCrossing, keepAdvancing:Bool)
    {
        let updateItems:[MGameUpdate<MOptionReformaCrossing>] = [
            model.laneGroup,
            model.foe,
            model.contact]
        self.keepAdvancing = keepAdvancing
        
        super.init(model:model, updateItems:updateItems)
    }
    
    override func update(
        elapsedTime:TimeInterval,
        scene:ViewGameScene<MOptionReformaCrossing>)
    {
        if keepAdvancing
        {
            super.update(elapsedTime:elapsedTime, scene:scene)
        }
        
        if let initialTime:TimeInterval = self.initialTime
        {
            let deltaTime:TimeInterval = elapsedTime - initialTime
            checkTimeout(deltaTime:deltaTime, scene:scene)
        }
        else
        {
            self.initialTime = elapsedTime
        }
    }
    
    //MARK: private
    
    private func checkTimeout(
        deltaTime:TimeInterval,
        scene:ViewGameScene<MOptionReformaCrossing>)
    {
        if deltaTime > kWait
        {
            guard
                
                let controller:COptionReformaCrossing = scene.controller as? COptionReformaCrossing
                
            else
            {
                return
            }
            
            timeOut(controller:controller)
        }
    }
    
    //MARK: public
    
    func timeOut(controller:COptionReformaCrossing)
    {
    }
}
