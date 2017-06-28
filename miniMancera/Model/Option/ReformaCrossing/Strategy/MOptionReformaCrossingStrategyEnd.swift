import SpriteKit

class MOptionReformaCrossingStrategyEnd:MGameStrategy<MOptionReformaCrossing>
{
    private let updateItems:[MGameUpdateProtocol]
    private var initialTime:TimeInterval?
    private let kWait:TimeInterval = 1.5
    
    override init(model:MOptionReformaCrossing)
    {
        updateItems = [
            model.laneGroup,
            model.foe,
            model.contact]
        
        super.init(model:model)
    }
    
    override func update(
        elapsedTime:TimeInterval,
        scene:SKScene)
    {
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
    
    func keepAdvancing(
        elapsedTime:TimeInterval,
        scene:SKScene)
    {
        for item:MGameUpdateProtocol in updateItems
        {
            item.update(elapsedTime:elapsedTime, scene:scene)
        }
    }
    
    func timeOut(controller:COptionReformaCrossing)
    {
    }
}
