import SpriteKit

class MOptionReformaCrossingStrategyEnd:MGameStrategyMain<MOptionReformaCrossing>
{
    private var initialTime:TimeInterval?
    private let keepAdvancing:Bool
    private let kWait:TimeInterval = 1.5
    
    init(model:MOptionReformaCrossing, keepAdvancing:Bool)
    {
        let updateItems:[MGameUpdateProtocol] = [
            model.laneGroup,
            model.foe,
            model.contact]
        self.keepAdvancing = keepAdvancing
        
        super.init(model:model, updateItems:updateItems)
    }
    
    override func update(
        elapsedTime:TimeInterval,
        scene:SKScene)
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
    
    private func checkTimeout(deltaTime:TimeInterval, scene:SKScene)
    {
        if deltaTime > kWait
        {
            guard
                
                let scene:VOptionReformaCrossingScene = scene as? VOptionReformaCrossingScene,
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
